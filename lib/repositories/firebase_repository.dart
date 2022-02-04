import 'dart:convert';

import 'package:chowsdelivery/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService {
  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  authsignUp(String email, String password, String username, String phone) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      CollectionReference users = firestore.collection('users');
      var documentId = users.doc();
      Users? user = Users(email: email, username: username, phone: phone, uuid: documentId.id, isAdmin: false);
      var userDetails = user.toJson();
      await documentId.set(userDetails);
      final SharedPreferences prefs = await _prefs;
      String savedUser = jsonEncode(user);
      prefs.setString('user', savedUser);
      return ({"usercredentials": userCredential});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return 'Something went wrong. Try again';
      }
    } catch (e) {
      return e.toString();
    }
  }

  authsingIn(String email, String password) async {
    final Users signedInUser;
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      var users = firestore.collection('users');
      var query = await users.where('email', isEqualTo: email).get();
      var queryData = query.docs.map((e) => e.data()).toList();
      signedInUser = Users.fromJson(queryData[0]);
      print("signed in user is ${signedInUser.phone}");
      final SharedPreferences prefs = await _prefs;
      String savedUser = jsonEncode(signedInUser);
      prefs.setString('user', savedUser);
      return ({"usercredentials": userCredential, "signedInUser": signedInUser});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ({"hasError": true, "message": "user not found"});
      } else if (e.code == 'wrong-password') {
        return ({"hasError": true, "message": 'Wrong password'});
      }
    } catch (e) {
      return ({"hasError": true, "message": "SignIn eror $e"});
    }
  }

  User? _user;

  getCurrentUser() {
    _user = _auth.currentUser;
    print("the user from firebase service is: ${_user?.email}");
    return _user;
  }
}

import 'dart:convert';

import 'package:chowsdelivery/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileNotifer extends StateNotifier<Users> {
  ProfileNotifer() : super(Users()) {
    getSignedInUserProfile();
  }
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getSignedInUserProfile() async {
    final SharedPreferences prefs = await _prefs;
    var user = prefs.getString('user');
    var decodedUser = jsonDecode(user!);
    print(decodedUser['uuid']);
    state = Users.fromJson(decodedUser);
    // print(user);
    // print(state);
    return state;
  }
}

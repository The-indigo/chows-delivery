import 'package:chowsdelivery/providers/providers.dart';
import 'package:chowsdelivery/repositories/firebase_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupNotifier extends ChangeNotifier {
  final Reader read;
  SignupNotifier(this.read);
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  FirebaseService get firebaseService => read(firebaseServiceProvider);

  signUp(String email, String password, String username, String phone) async {
    try {
      _isLoading = true;
      notifyListeners();
      var response = await firebaseService.authsignUp(email, password, username, phone);
      print("responsessss $response");
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

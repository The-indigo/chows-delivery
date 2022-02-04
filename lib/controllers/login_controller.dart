import 'package:chowsdelivery/providers/providers.dart';
import 'package:chowsdelivery/repositories/firebase_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginNotifier extends StateNotifier<bool> {
  final Reader read;
  LoginNotifier(this.read) : super(_initialState);
  static const _initialState = false;

  FirebaseService get firebaseService => read(firebaseServiceProvider);

  Future<String> login(String email, String password) async {
    String message;
    state = true;
    try {
      var response = await firebaseService.authsingIn(email, password);
      print("login response $response");
      if (response != null) {
        if (response["hasError"] != null) {
          state = false;
          message = response['message'];
        } else {
          state = false;
          message = "Login Successfull";
        }
      } else {
        state = false;
        message = "No response, Check your internet connection and try again";
      }
      return message;
    } catch (e) {
      print("login exception error $e");
      state = false;
      message = "App error, please try again";
      return message;
    }
  }
}

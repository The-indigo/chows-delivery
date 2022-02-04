import 'dart:async';

import 'package:chowsdelivery/providers/providers.dart';
import 'package:chowsdelivery/repositories/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashscreenNotifier extends ChangeNotifier {
  final Reader read;

  SplashscreenNotifier(this.read);

  FirebaseService get firebaseService => read(firebaseServiceProvider);

  void getCurrentUser(BuildContext context) async {
    final user = await firebaseService.getCurrentUser();
    Timer(Duration(seconds: 2), () async {
      Navigator.pushNamedAndRemoveUntil(context, user == null ? '/login' : '/home', (route) => false);
    });
    print("the user is $user");
  }
}

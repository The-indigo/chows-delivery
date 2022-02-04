// import 'dart:async';

// import 'package:chowsdelivery/providers/providers.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:http/http.dart';

// class AuthController extends StateNotifier<User?> {
//   final Reader read;

//   StreamSubscription<User?>? _authStateChangesSubscription;
//   AuthController(this.read) : super(null) {
//     _authStateChangesSubscription?.cancel();
//     _authStateChangesSubscription = read(authRepositoryProvider).authStateChanges.listen((event) => state = event);
//   }

//   void appStarted() async {
//     final user = read(authRepositoryProvider).getCurrentUser();
//     if (user == null) {
//       await read(authRepositoryProvider).signInAnonymously();
//     }
//   }

//   void signout() async {
//     await read(authRepositoryProvider).signOut();
//   }

//   @override
//   void dispose() {
//     _authStateChangesSubscription?.cancel();
//     super.dispose();
//   }
// }

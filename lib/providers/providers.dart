import 'dart:convert';

import 'package:chowsdelivery/controllers/cart_controller.dart';
import 'package:chowsdelivery/controllers/product_controller.dart';
import 'package:chowsdelivery/controllers/profile_controller.dart';
import 'package:chowsdelivery/controllers/splashscreen_controller.dart';
import 'package:chowsdelivery/models/cart_model.dart';
import 'package:chowsdelivery/models/product_model.dart';
import 'package:chowsdelivery/models/user_model.dart';
import 'package:chowsdelivery/repositories/cart_repository.dart';
import 'package:chowsdelivery/repositories/firebase_repository.dart';
import 'package:chowsdelivery/controllers/login_controller.dart';
import 'package:chowsdelivery/controllers/signup_controller.dart';
import 'package:chowsdelivery/repositories/product_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// REPOSITORIES
final productRepository = Provider((ref) => ProductRepository());
final firebaseServiceProvider = Provider((ref) => FirebaseService());
final cartRepository = Provider((ref) => CartRepository());

final sharedPref = FutureProvider<SharedPreferences>((ref) async {
  final pref = await SharedPreferences.getInstance();
  return pref;
});

final signedInUserProvider = Provider((ref) {
  final check = ref.watch(sharedPref).maybeWhen(data: (data) => data.getString('user'), orElse: () => null);
  var decodedUser = jsonDecode(check!);
  var signedInUser = Users.fromJson(decodedUser);
  return signedInUser;
});

// COONTROLLERS

final cartProvider = ChangeNotifierProvider<CartNotifier>((ref) => CartNotifier(ref));

final cartStreamProvider = StreamProvider.autoDispose((ref) {
  final user = ref.watch(profileScreenProvider);
  return ref.watch(cartRepository).getUserCartItems(user.uuid!);
});

final signupProvider = ChangeNotifierProvider<SignupNotifier>((ref) {
  return SignupNotifier(ref.read);
});
final loginProvider = StateNotifierProvider<LoginNotifier, bool>((ref) => LoginNotifier(ref.read));
final splashscreenProvider = Provider((ref) => SplashscreenNotifier(ref.read));
final profileScreenProvider = StateNotifierProvider<ProfileNotifer, Users>((ref) => ProfileNotifer());
final productProvider = StateNotifierProvider<ProductNotifier, AsyncValue<List<Product>>>(
    (ref) => ProductNotifier(ref.read)..allProducts());
    

// final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
// final firebaseFirestoreProvider = Provider((ref) => FirebaseFirestore.instance);
// final authControllerProvider =
//     StateNotifierProvider<AuthController, User?>((ref) => AuthController(ref.read)..appStarted());

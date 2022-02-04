import 'package:chowsdelivery/ui/bottomnavigation/bottomnavigation.dart';
import 'package:chowsdelivery/ui/login/login_view.dart';
import 'package:chowsdelivery/ui/signup/signup_view.dart';
import 'package:chowsdelivery/ui/splashscreen/splashscreen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => SplashScreen(),
      '/login': (context) => LoginScreen(),
      '/signup': (context) => SignupScreen(),
      '/home': (context) => BottomNav()
    });
  }
}

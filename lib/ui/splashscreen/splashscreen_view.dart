import 'package:chowsdelivery/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(splashscreenProvider).getCurrentUser(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
              child: SizedBox(
            height: 70,
            width: 100,
            child: Center(
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w800),
                      children: const <TextSpan>[
                    TextSpan(text: 'Uncle '),
                    TextSpan(text: 'Chow\'s', style: TextStyle(color: Color(0xff19388A)))
                  ])),
            ),
          )),
        ));
  }
}

import 'package:chowsdelivery/providers/providers.dart';
import 'package:chowsdelivery/sharedwidgets/button.dart';
import 'package:chowsdelivery/sharedwidgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String? email;
  String? password;
  final _signInFormKey = GlobalKey<FormState>();
  final _signInScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final login = ref.watch(loginProvider);
    return Scaffold(
        key: _signInScaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: login,
          child: SafeArea(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
              Center(
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w800),
                        children: const <TextSpan>[
                      TextSpan(text: 'Uncle '),
                      TextSpan(text: 'Chow\'s', style: TextStyle(color: Color(0xff19388A)))
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Login to your account",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      ContainerTextFied(
                        label: "Email",
                        obscure: false,
                        onChanged: (String value) {
                          email = value.trim();
                        },
                      ),
                      SizedBox(height: 23),
                      ContainerTextFied(
                        label: "Password",
                        obscure: true,
                        onChanged: (String value) {
                          password = value;
                        },
                      ),
                      SizedBox(height: 24),
                      Buttons(
                          text: "Sign in",
                          pressed: () async {
                            var loginResponse = await ref.read(loginProvider.notifier).login(email!, password!);
                            loginResponse == "Login Successfull"
                                ? Navigator.pushReplacementNamed(context, '/home')
                                : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    backgroundColor: Colors.deepOrange[200],
                                    content: Text(loginResponse),
                                    duration: Duration(seconds: 3),
                                  ));
                          }),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Text('-Or sign in with-'),
                  SizedBox(height: 4),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const <Widget>[
                    ElevatedButton(onPressed: null, child: Icon(Icons.access_time_filled)),
                    ElevatedButton(onPressed: null, child: Icon(Icons.access_time_filled)),
                    ElevatedButton(onPressed: null, child: Icon(Icons.access_time_filled))
                  ]),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: RichText(
                    text: TextSpan(style: TextStyle(color: Colors.black), children: const <TextSpan>[
                  TextSpan(text: 'Don\'t have an account?'),
                  TextSpan(text: 'Sign Up', style: TextStyle(color: Color(0xff19388A)))
                ])),
              )
            ]),
          ),
        ));
  }
}

import 'package:chowsdelivery/providers/providers.dart';
import 'package:chowsdelivery/sharedwidgets/button.dart';
import 'package:chowsdelivery/sharedwidgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  String? email;
  String? password;
  String? phone;
  String? username;
  String? confirmPassword;
  final _signupFormKey = GlobalKey<FormState>();
  final _signUpScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final signUp = ref.watch(signupProvider);
    return Scaffold(
        key: _signUpScaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: signUp.isLoading,
          child: SafeArea(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(Icons.arrow_back, color: Colors.blue[900]),
                  ),
                  Center(
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w800),
                            children: const <TextSpan>[
                          TextSpan(text: 'Uncle '),
                          TextSpan(text: 'Chow\'s', style: TextStyle(color: Color(0xff19388A)))
                        ])),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: _signupFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Create your Account",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      ContainerTextFied(
                        label: "Email",
                        obscure: false,
                        onChanged: (String value) {
                          email = value.trim();
                        },
                        // validate: (String value) {
                        //   String errorMessage;
                        //   if (value.isEmpty) {
                        //     errorMessage = "Email field is Empty";
                        //   } else if (!(value.contains("@"))) {
                        //     errorMessage = "Please enter a valid email";
                        //   }
                        //   return errorMessage;
                        // },
                      ),
                      SizedBox(height: 23),
                      ContainerTextFied(
                        label: "Phone Number",
                        obscure: false,
                        onChanged: (String value) {
                          phone = value.trim();
                        },
                        // validate: (String value) {
                        //   String errorMessage;
                        //   if (value.isEmpty) {
                        //     errorMessage = "Phone number field is Empty";
                        //   }
                        //   return errorMessage;
                        // },
                      ),
                      SizedBox(height: 23),
                      ContainerTextFied(
                        label: "Username",
                        obscure: false,
                        onChanged: (String value) {
                          username = value.trim();
                        },
                        // validate: (String value) {
                        //   String errorMessage;
                        //   if (value.isEmpty) {
                        //     errorMessage = "Usernamefield is Empty";
                        //   }
                        //   return errorMessage;
                        // },
                      ),
                      SizedBox(height: 23),
                      ContainerTextFied(
                        label: "Password",
                        obscure: true,
                        onChanged: (String value) {
                          password = value;
                        },
                        // validate: (String value) {
                        //   String errorMessage;
                        //   if (value.isEmpty) {
                        //     errorMessage = "Password field is required";
                        //   } else if (value.length < 6) {
                        //     errorMessage =
                        //         "Password cannot be less than 6 characters";
                        //   }
                        //   return errorMessage;
                        // },
                      ),
                      SizedBox(height: 24),
                      ContainerTextFied(
                        label: "Confirm Password",
                        obscure: true,
                        onChanged: (String value) {
                          confirmPassword = value;
                        },
                        // validate: (String value) {
                        //   String errorMessage;

                        //   if (!(value == password)) {
                        //     errorMessage = "Password do not match";
                        //   }
                        //   if (value.isEmpty) {
                        //     errorMessage = "Re enter password";
                        //   }
                        //   return errorMessage;
                        // },
                      ),
                      SizedBox(height: 24),
                      Buttons(
                          text: "Sign up",
                          pressed: () {
                            ref.read(signupProvider).signUp(email!, password!, username!, phone!);
                          }

                          // if (_signupFormKey.currentState.validate()) {
                          //   _signupFormKey.currentState.save();
                          //   try {
                          //     final response = await model.signUp(
                          //         email, password,
                          //          username,
                          //          phone);
                          //     if (response['hasError']) {
                          //       ScaffoldMessenger.of(context)
                          //           .showSnackBar(SnackBar(
                          //         content: Text(response['message']),
                          //         duration: Duration(seconds: 3),
                          //       ));
                          //     } else {
                          //       ScaffoldMessenger.of(context)
                          //           .showSnackBar(SnackBar(
                          //         content: Text(response['message']),
                          //         duration: Duration(seconds: 3),
                          //       ));
                          //       // Navigator.pushReplacementNamed(context, '/home');
                          //     }
                          //   } on Exception catch(error){
                          //     print(error);
                          //   }
                          //    catch (error) {
                          //     print(error);
                          //   }
                          // }

                          )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Text('-Or sign up with-'),
                  SizedBox(height: 4),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const <Widget>[
                    ElevatedButton(onPressed: null, child: Icon(Icons.access_time_filled)),
                    ElevatedButton(onPressed: null, child: Icon(Icons.access_time_filled)),
                    ElevatedButton(onPressed: null, child: Icon(Icons.access_time_filled))
                  ]),
                ],
              ),
              SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: RichText(
                    text: TextSpan(style: TextStyle(color: Colors.black), children: const <TextSpan>[
                  TextSpan(text: 'Already have an account?'),
                  TextSpan(text: 'Sign In', style: TextStyle(color: Color(0xff19388A)))
                ])),
              ),
            ]),
          ),
        ));
  }
}

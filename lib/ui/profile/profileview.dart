import 'package:chowsdelivery/providers/providers.dart';
import 'package:chowsdelivery/sharedwidgets/button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileView extends HookConsumerWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(profileScreenProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 70,
          ),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/coffee.jpeg'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Edit',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Account',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(height: 7),
                    Card(
                      elevation: 5,
                      child: Column(children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text(userProfile.username ?? ""),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.phone_iphone),
                          title: Text(userProfile.phone ?? ""),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.email),
                          title: Text(userProfile.email ?? ""),
                        ),
                        Divider(),
                      ]),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Buttons(
                        text: "Sign out",
                        pressed: () {
                          Navigator.pushReplacementNamed(context, '/');
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreenTopRow extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  HomeScreenTopRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Uncle Chow\'s',
          style: TextStyle(color: Colors.redAccent, fontSize: 15.0, fontWeight: FontWeight.w600),
        ),
        GestureDetector(
            onTap: () {
              _auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Icon(Icons.logout, color: Theme.of(context).primaryColor))
      ],
    );
  }
}

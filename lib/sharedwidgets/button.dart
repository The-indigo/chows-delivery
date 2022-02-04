import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String? text;
  final Function? pressed;
  const Buttons({Key? key, this.text, this.pressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        pressed!();
      },
      child: Text(
        text!,
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(9),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
          padding: MaterialStateProperty.all(EdgeInsets.all(13)),
          backgroundColor: MaterialStateProperty.all(Colors.blue[900])),
    );
  }
}

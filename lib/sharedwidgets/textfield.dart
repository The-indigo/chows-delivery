import 'package:flutter/material.dart';

class ContainerTextFied extends StatelessWidget {
  final String? label;
  final bool? obscure;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validate;
  const ContainerTextFied({Key? key, this.label, this.obscure, this.onChanged, this.validate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(boxShadow: const [BoxShadow(offset: Offset(1.0, 5.0), color: Colors.grey, blurRadius: 15.0)]),
      child: TextFormField(
        
          obscureText: obscure!,
          // validator:  validate!,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          )),
    );
  }
}

import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final void Function(String) onChanged;
  const Search({Key? key, required this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
        child: Material(
          elevation: 6.0,
          borderRadius: BorderRadius.circular(15),
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.5, color: Colors.black),
              labelText: 'Search',
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
              fillColor: Colors.white,
              suffixIcon: Icon(
                Icons.search,
                size: 18.0,
                color: Colors.black,
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
            ),
          ),
        ));
  }
}

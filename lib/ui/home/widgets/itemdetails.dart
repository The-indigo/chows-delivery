// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? id;
  final String? name;
  final String? imagePath;
  final String? category;
  final dynamic amount;
  final Function? clicked;
  const ItemDetails({
    Key? key,
    this.id,
    this.name,
    this.imagePath,
    this.category,
    this.amount,
    this.clicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imagePath!), fit: BoxFit.fitHeight),
                  borderRadius: BorderRadius.circular(20)),
              height: 200.0,
              width: MediaQuery.of(context).size.width * 0.95,
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              child: Container(
                height: 50.0,
                width: 340.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.black12],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
              left: 8.0,
              bottom: 10.0,
              right: 9.0,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                Text(
                  name!,
                  style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    clicked!();
                  },
                  child: Text(
                    'Add to cart',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  "$amount",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class FoodCategory extends StatefulWidget {
  final Function ?click;
  FoodCategory({this.click});

  @override
  _FoodCategoryState createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  List categories=[];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
               // widget.click(index);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage(categories[index].imagePath),
                        height: 65.0,
                        width: 65.0,
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categories[index].categoryName,
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: 5.0),
                          //Text(categories[index].numberOfItems.toString())
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
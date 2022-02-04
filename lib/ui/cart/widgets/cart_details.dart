import 'package:flutter/material.dart';

class CartDetails extends StatelessWidget {
  dynamic quantity;
  String itemName;
  String id;
  ImageProvider image;
  dynamic itemTotal;
  dynamic originalAmount;
  Function increase;
  Function decrease;
  //Function changeTotal;
  Function remove;

  CartDetails(
      {Key? key,
      required this.id,
      required this.quantity,
      required this.itemTotal,
      required this.originalAmount,
      required this.itemName,
      required this.increase,
      required this.decrease,
      //required this.changeTotal,
      required this.image,
      required this.remove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dismissible(
          key: Key("item"),
          child: Row(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(color: Color(0xffedc774), borderRadius: BorderRadius.circular(10)),
                  ),
                  Positioned(
                    right: -7,
                    top: -11,
                    child: SizedBox(
                        height: 65,
                        width: 65,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image(
                              image: image,
                              fit: BoxFit.cover,
                            ))),
                  )
                ],
              ),
              SizedBox(width: 15),
              Column(
                children: <Widget>[
                  Text(itemName, style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w600)),
                  SizedBox(height: 7),
                  Row(
                    children: <Widget>[
                      Text('x ${quantity.toString()}'),
                      SizedBox(width: 9),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              increase();
                              //changeTotal();
                            },
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 5),
                          InkWell(
                              onTap: () {
                                decrease();
                                //changeTotal();
                              },
                              child: Icon(Icons.keyboard_arrow_down, color: Colors.grey))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Text("# ${itemTotal == 0 ? originalAmount.toString() : itemTotal.toString()}",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
              SizedBox(width: 15.0),
              GestureDetector(
                  onTap: () {
                    remove();
                  },
                  child: Icon(
                    Icons.delete_sharp,
                    color: Colors.red[400],
                    size: 25.0,
                  ))
            ],
          ),
        ),
        Divider(thickness: 1.2)
      ],
    );
  }
}

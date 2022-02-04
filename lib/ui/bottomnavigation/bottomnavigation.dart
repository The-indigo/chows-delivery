import 'package:chowsdelivery/ui/cart/cart_view.dart';
import 'package:chowsdelivery/ui/home/homeview.dart';
import 'package:chowsdelivery/ui/profile/profileview.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  List<Widget> pages = <Widget>[HomeScreen(), CartScreen(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: pages.elementAt(selectedIndex),
    );
  }
}

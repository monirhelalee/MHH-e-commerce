import 'package:flutter/material.dart';
import 'package:mhh_shop/cart/cart_screen.dart';
import 'package:mhh_shop/category/category_screen.dart';
import 'package:mhh_shop/home/view/home_screen.dart';
import 'package:mhh_shop/profile/profile_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: selectedScreen == 0
          ? HomeScreen()
          : selectedScreen == 1
              ? CategoryScreen()
              : selectedScreen == 2
                  ? CartScreen()
                  : ProfileScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(15)),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  selectedScreen = 0;
                  setState(() {});
                },
                icon: Icon(
                  selectedScreen == 0 ? Icons.home : Icons.home_outlined,
                  color: Colors.white,
                  size: 35,
                )),
            IconButton(
                onPressed: () {
                  selectedScreen = 1;
                  setState(() {});
                },
                icon: Icon(
                  selectedScreen == 1
                      ? Icons.category
                      : Icons.category_outlined,
                  color: Colors.white,
                  size: 35,
                )),
            IconButton(
                onPressed: () {
                  selectedScreen = 2;
                  setState(() {});
                },
                icon: Icon(
                  selectedScreen == 2
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 35,
                )),
            IconButton(
                onPressed: () {
                  selectedScreen = 3;
                  setState(() {});
                },
                icon: Icon(
                  selectedScreen == 3
                      ? Icons.person_rounded
                      : Icons.person_outline_rounded,
                  color: Colors.white,
                  size: 35,
                )),
          ],
        ),
      ),
    ));
  }
}

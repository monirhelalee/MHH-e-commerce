import 'package:flutter/material.dart';
import 'package:mhh_shop/app_theme/app_theme.dart';
import 'package:mhh_shop/cart/cart_screen.dart';
import 'package:mhh_shop/category/category_screen.dart';
import 'package:mhh_shop/home/view/home_screen.dart';
import 'package:mhh_shop/offer/offer_screen.dart';
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
    Widget nevBarIcon({
      required String bottomName,
      required int selectIndex,
      required IconData icon,
    }) {
      return InkWell(
        onTap: () {
          selectedScreen = selectIndex;
          setState(() {});
        },
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10),
          child: Column(
            children: [
              Icon(
                icon,
                color: selectedScreen == selectIndex
                    ? AppTheme.colorPrimary
                    : AppTheme.grey,
                size: 30,
              ),
              Text(
                "$bottomName",
                style: TextStyle(
                    fontSize: 12,
                    color: selectedScreen == selectIndex
                        ? AppTheme.colorPrimary
                        : AppTheme.grey,
                    fontWeight: selectedScreen == selectIndex
                        ? FontWeight.bold
                        : FontWeight.normal),
              )
            ],
          ),
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
      body: selectedScreen == 0
          ? HomeScreen()
          : selectedScreen == 1
              ? CategoryScreen()
              : selectedScreen == 2
                  ? CartScreen()
                  : selectedScreen == 3
                      ? OfferScreen()
                      : ProfileScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white30,
        ),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            nevBarIcon(
              bottomName: "Home",
              selectIndex: 0,
              icon: Icons.home_outlined,
            ),
            nevBarIcon(
              bottomName: "Explore",
              selectIndex: 1,
              icon: Icons.search,
            ),
            nevBarIcon(
              bottomName: "Cart",
              selectIndex: 2,
              icon: Icons.shopping_cart_outlined,
            ),
            nevBarIcon(
              bottomName: "Offer",
              selectIndex: 3,
              icon: Icons.local_offer_outlined,
            ),
            nevBarIcon(
              bottomName: "Account",
              selectIndex: 4,
              icon: Icons.person_outline_rounded,
            ),
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:mhh_shop/bottom_nav_bar_screen.dart';
import 'package:mhh_shop/home/view_model/all_product_view_model.dart';
import 'package:mhh_shop/home/view_model/category_view_model.dart';
import 'package:mhh_shop/product_details/view_model/product_details_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryViewModel()),
        ChangeNotifierProvider(create: (context) => AllProductViewModel()),
        ChangeNotifierProvider(create: (context) => ProductDetailsViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BottomNavBarScreen(),
      ),
    );
  }
}

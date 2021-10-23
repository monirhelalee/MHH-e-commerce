import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhh_shop/category/widget/category_card.dart';
import 'package:mhh_shop/home/view/widget/home_category_card.dart';
import 'package:mhh_shop/home/view/widget/product_card.dart';
import 'package:mhh_shop/home/view_model/all_product_view_model.dart';
import 'package:mhh_shop/home/view_model/category_view_model.dart';
import 'package:provider/provider.dart';
import 'package:string_extensions/string_extensions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<AllProductViewModel>(context, listen: false)
          .getAllProducts();
      await Provider.of<CategoryViewModel>(context, listen: false)
          .getCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var categoryVM = Provider.of<CategoryViewModel>(context);
    var allProductsVM = Provider.of<AllProductViewModel>(context);
    Widget profileIcon = Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.black87),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
    Widget shopName = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "M.H.H.",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          Text(
            "Online Store",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
    Widget topCategory = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 5),
          child: Text(
            "Categories",
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categoryVM.categoryList.length,
              itemBuilder: (context, index) {
                return HomeCategoryCard(
                  categoryName: categoryVM.categoryList[index]
                          ?.toString()
                          .toTitleCase() ??
                      "",
                );
              }),
        )
      ],
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
            categoryVM.categoryList.isEmpty || allProductsVM.allProduct!.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.black87,
                  ))
                : SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //profileIcon,
                          SizedBox(
                            height: 20,
                          ),
                          shopName,
                          topCategory,
                          GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 1.25 / 2,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0),
                              itemCount: allProductsVM.allProduct!.length,
                              itemBuilder: (context, index) {
                                return ProductCard(
                                  products: allProductsVM.allProduct![index],
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}

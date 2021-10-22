import 'package:flutter/material.dart';
import 'package:mhh_shop/category/widget/category_card.dart';
import 'package:mhh_shop/home/view_model/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var categoryVM = Provider.of<CategoryViewModel>(context);
    print(MediaQuery.of(context).size.width.toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Category"),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          child: ListView.builder(
              itemCount: categoryVM.categoryList.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  categoryName: categoryVM.categoryList[index],
                );
              }),
        ),
      ),
    );
  }
}

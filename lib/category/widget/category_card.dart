import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_extensions/string_extensions.dart';

class CategoryCard extends StatefulWidget {
  String? categoryName;
  CategoryCard({Key? key, required this.categoryName}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black87,
        ),
        height: 70,
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Row(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 45,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .1,
              ),
              Text(
                "${widget.categoryName?.toTitleCase() ?? ""}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

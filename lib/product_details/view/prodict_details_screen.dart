import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhh_shop/app_theme/app_theme.dart';
import 'package:mhh_shop/product_details/view_model/product_details_view_model.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int? id;
  ProductDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<ProductDetailsViewModel>(context, listen: false)
          .getProductDetails(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productDetailsVm =
        Provider.of<ProductDetailsViewModel>(context, listen: true);
    final List<String> imgList = [
      "${productDetailsVm.productDetails?.image ?? ""}",
      "${productDetailsVm.productDetails?.image ?? ""}",
      "${productDetailsVm.productDetails?.image ?? ""}",
      "${productDetailsVm.productDetails?.image ?? ""}",
    ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: StreamBuilder<Object>(
                        stream: null,
                        builder: (context, snapshot) {
                          return Stack(
                            children: <Widget>[
                              Image.network(
                                item,
                                fit: BoxFit.cover,
                              ),
                            ],
                          );
                        })),
              ),
            ))
        .toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${productDetailsVm.productDetails?.title ?? ""}",
            style: GoogleFonts.poppins(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.grey,
            ),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        body: productDetailsVm.productDetails == null
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                        ),
                        items: imageSliders,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .8,
                            child: Text(
                              "${productDetailsVm.productDetails?.title ?? ""}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.darkBlue,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.favorite_outline_rounded,
                            color: AppTheme.grey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RatingBarIndicator(
                      rating:
                          productDetailsVm.productDetails?.rating?.rate ?? 0.0,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      unratedColor: Colors.amber.withAlpha(50),
                      direction: Axis.horizontal,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$${productDetailsVm.productDetails?.price ?? 0.0}",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.colorPrimary,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Select Size",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: index == 2 ? 2 : 1,
                                    color: index == 2
                                        ? AppTheme.colorPrimary
                                        : AppTheme.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Select Color",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                ),
                                child: index == 1
                                    ? Center(
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${productDetailsVm.productDetails?.description ?? ""}",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

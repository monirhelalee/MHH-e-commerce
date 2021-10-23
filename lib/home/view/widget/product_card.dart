import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhh_shop/app_theme/app_theme.dart';
import 'package:mhh_shop/home/model/all_product_model.dart';
import 'package:mhh_shop/product_details/view/prodict_details_screen.dart';
import 'package:mhh_shop/product_details/view_model/product_details_view_model.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  AllProductModel products;
  ProductCard({Key? key, required this.products}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Provider.of<ProductDetailsViewModel>(context, listen: false)
              .productDetails = null;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                        id: widget.products.id,
                      )));
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppTheme.lightGrey, width: 1)),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image.network(
                      "${widget.products.image}",
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.products.title ?? ""}",
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.darkBlue),
                      ),
                      RatingBarIndicator(
                        rating: widget.products.rating!.rate,
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
                        "\$${widget.products.price ?? ""}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.colorPrimary,
                            letterSpacing: 2),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$543.22",
                            style: GoogleFonts.poppins(
                              color: AppTheme.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "25% off",
                            style:
                                GoogleFonts.poppins(color: AppTheme.primaryRed),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Container(
        //   decoration: BoxDecoration(
        //     color: Colors.blueGrey.shade100,
        //     borderRadius: BorderRadius.circular(15),
        //   ),
        //   child: Stack(
        //     alignment: AlignmentDirectional.bottomEnd,
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.all(10.0),
        //         child: Image.network(
        //           "${widget.products.image}",
        //           fit: BoxFit.fill,
        //           height: 500,
        //           width: double.infinity,
        //         ),
        //       ),
        //       Container(
        //           height: 80,
        //           decoration: BoxDecoration(
        //               color: Colors.black87,
        //               borderRadius: BorderRadius.circular(15)),
        //           child: Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: [
        //                 Text(
        //                   "${widget.products.title ?? ""}",
        //                   maxLines: 2,
        //                   style: TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 14,
        //                       fontWeight: FontWeight.bold),
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Text(
        //                       "TK${widget.products.price ?? ""}",
        //                       maxLines: 1,
        //                       style: TextStyle(
        //                           color: Colors.white,
        //                           fontSize: 12,
        //                           fontWeight: FontWeight.bold),
        //                     ),
        //                     Row(
        //                       children: [
        //                         Icon(
        //                           Icons.star_rounded,
        //                           color: Colors.white,
        //                           size: 16,
        //                         ),
        //                         SizedBox(
        //                           width: 2,
        //                         ),
        //                         Text(
        //                           "${widget.products.rating?.rate ?? ""} (${widget.products.rating?.count ?? ""})",
        //                           maxLines: 1,
        //                           style: TextStyle(
        //                               color: Colors.white,
        //                               fontSize: 12,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           )),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

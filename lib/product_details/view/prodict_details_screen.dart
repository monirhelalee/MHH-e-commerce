import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        body: productDetailsVm.productDetails == null
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: Center(
                    child: Text(
                        "${productDetailsVm.productDetails?.title ?? "0"}")),
              ),
      ),
    );
  }
}

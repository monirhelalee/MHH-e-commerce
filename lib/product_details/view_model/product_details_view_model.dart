import 'package:flutter/cupertino.dart';
import 'package:mhh_shop/appError.dart';
import 'package:mhh_shop/home/repo/all_product_repo.dart';
import 'package:mhh_shop/product_details/model/product_details_model.dart';
import 'package:mhh_shop/product_details/repo/product_details_repo.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  ProductDetailsModel? productDetails;
  AppError? appError;

  Future<void> getProductDetails(int? id) async {
    productDetails = null;
    var res = await ProductDetailsRepository().getProductDetails(id);
    notifyListeners();
    res.fold((l) {
      appError = l;
      notifyListeners();
    }, (r) {
      productDetails = r;
      notifyListeners();
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:mhh_shop/appError.dart';
import 'package:mhh_shop/home/model/all_product_model.dart';
import 'package:mhh_shop/home/repo/all_product_repo.dart';
import 'package:mhh_shop/home/repo/categories_repo.dart';

class AllProductViewModel extends ChangeNotifier {
  List<AllProductModel>? allProduct = [];
  AppError? appError;

  Future<void> getAllProducts() async {
    var res = await AllProductRepository().getAllProduct();
    notifyListeners();
    res.fold((l) {
      appError = l;
      notifyListeners();
    }, (r) {
      allProduct = r;
      notifyListeners();
    });
  }
}

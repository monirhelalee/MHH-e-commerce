import 'package:flutter/cupertino.dart';
import 'package:mhh_shop/appError.dart';
import 'package:mhh_shop/home/repo/categories_repo.dart';

class CategoryViewModel extends ChangeNotifier {
  List<dynamic> categoryList = [];
  AppError? appError;

  Future<void> getCategory() async {
    var res = await CategoryRepository().getCategory();
    notifyListeners();
    res.fold((l) {
      appError = l;
      notifyListeners();
    }, (r) {
      categoryList = r;
      notifyListeners();
    });
  }
}

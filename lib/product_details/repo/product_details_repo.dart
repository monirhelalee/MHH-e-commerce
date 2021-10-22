import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mhh_shop/appError.dart';
import 'package:mhh_shop/home/model/all_product_model.dart';
import 'package:mhh_shop/product_details/model/product_details_model.dart';

class ProductDetailsRepository {
  Future<Either<AppError, ProductDetailsModel>> getProductDetails(
      int? id) async {
    var url = 'https://fakestoreapi.com/products/$id';
    var res = await http.get(Uri.parse(url));
    print(res.body);
    if (res.statusCode == 200) {
      var data = productDetailsModelFromJson(res.body);
      return Right(data);
    } else {
      BotToast.showText(text: 'Fail to load data');
      return Left(AppError.serverError);
    }
  }
}

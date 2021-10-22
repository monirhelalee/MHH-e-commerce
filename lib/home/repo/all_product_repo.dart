import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mhh_shop/appError.dart';
import 'package:mhh_shop/home/model/all_product_model.dart';

class AllProductRepository {
  Future<Either<AppError, List<AllProductModel>>> getAllProduct() async {
    var url = 'https://fakestoreapi.com/products';
    var res = await http.get(Uri.parse(url));
    print(res.body);
    if (res.statusCode == 200) {
      var data = allProductModelFromJson(res.body);
      return Right(data);
    } else {
      BotToast.showText(text: 'Fail to load data');
      return Left(AppError.serverError);
    }
  }
}

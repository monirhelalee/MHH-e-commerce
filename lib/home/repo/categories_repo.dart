import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mhh_shop/appError.dart';

class CategoryRepository {
  Future<Either<AppError, List<dynamic>>> getCategory() async {
    var url = 'https://fakestoreapi.com/products/categories';
    var res = await http.get(Uri.parse(url));
    print(res.body);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return Right(data);
    } else {
      BotToast.showText(text: 'Fail  to load data');
      return Left(AppError.serverError);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_login_dummyjson/model/login_model.dart';
import 'package:flutter_login_dummyjson/model/product_model.dart';
import 'package:flutter_login_dummyjson/utility/my_shared_preference.dart';

Dio dio = Dio()
  ..options.baseUrl = 'https://dummyjson.com/'
  ..options.connectTimeout = const Duration(seconds: 5)
  ..options.receiveTimeout = const Duration(seconds: 5)
  ..options.headers = {
    'Authorization': MySharedPreference.getToken(),
  };

Future<Product?> getAllProduct(int skip) async {
  try {
    var response = await dio.get(
      'auth/products',
      options: Options(
        headers: {
          'Authorization': MySharedPreference.getToken(),
        },
      ),
      queryParameters: {'skip': skip},
    );
    return Product.fromJson(response.data);
  } on DioException {
    return null;
  }
}

Future<LoginModel?> logIn(String username, String password) async {
  try {
    var response = await dio.post(
      'auth/login',
      data: {'username': username, 'password': password},
    );
    var result = LoginModel.fromJson(response.data);
    dio.options.headers = {'Authorization': result.token};
    return result;
  } on DioException {
    return null;
  }
}

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init()
  {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String path,
      Map<String, dynamic> ?query,
      
      String? token}) async
  {
    return await dio.get(
      path,
     queryParameters: query,
    );
  }

  
}
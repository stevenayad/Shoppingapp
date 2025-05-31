import 'package:dio/dio.dart';

class ApiServer {
  final _baseurl = 'https://dummyjson.com/products';
  final Dio dio;
  ApiServer(this.dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var respone = await dio.get('$_baseurl$endpoint');
    return respone.data;
  }
}

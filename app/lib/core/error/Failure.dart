import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class servivefailure extends Failure {
  servivefailure(super.errMessage);

  factory servivefailure.fromDioError(DioError dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return servivefailure("Connection timeout With Apiserver");
      case DioExceptionType.sendTimeout:
        return servivefailure("Send timeout With Apiserver");
      case DioExceptionType.receiveTimeout:
        return servivefailure("Recive timeout With Apiserver");
      case DioExceptionType.badCertificate:
        return servivefailure("lk");
      case DioExceptionType.badResponse:
        return servivefailure.badResponse(
            dioerror.response!.statusCode!, dioerror.response!.data!);
      case DioExceptionType.cancel:
        return servivefailure("Request with api server was cancled");
      case DioExceptionType.connectionError:
        return servivefailure("Connection error");
      case DioExceptionType.unknown:
        if (dioerror.message!.contains("SocketException")) {
          return servivefailure("No Internet Connection");
        }
        return servivefailure("Un Expected error , please try again");

      default:
        return servivefailure("Opps error");
    }
  }

  factory servivefailure.badResponse(int statscode, dynamic Respone) {
    if (statscode == 400 || statscode == 401 || statscode == 403) {
      return servivefailure(Respone['error']['message']);
    } else if (statscode == 404) {
      return servivefailure("Your request Not found , please try again");
    } else if (statscode == 500) {
      return servivefailure("Internal server error ,please try again");
    } else {
      return servivefailure("Opps error");
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_media_markt/data/core/api_constans.dart';
import 'package:flutter_media_markt/domain/entities/app_error.dart';

class ApiClient {
  final Dio _dio;

  const ApiClient(this._dio);

  dynamic get(
    String path, {
    Map<String, dynamic> queryParameters,
  }) async {
    Response response;

    try {
      response = await _dio.get(
        '${ApiConstants.BASE_URL}$path',
        queryParameters: queryParameters,
      );
    } on DioError catch (e) {
      return throw this._getDioError(e);
    }

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return throw AppError(
        AppErrorType.api,
        'Status code: ${response.statusCode}',
      );
    }
  }

  AppError _getDioError(DioError dioError) {
    String error;

    switch (dioError.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        error = "When opening  url timeout, it occurs.";
        break;
      case DioErrorType.SEND_TIMEOUT:
        error = "It occurs when receiving timeout.";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        error = "Error";
        break;
      case DioErrorType.RESPONSE:
        error = "${dioError.response.statusCode} ${dioError.response.data}";
        break;
      case DioErrorType.CANCEL:
        error = "The request has been canceled";
        break;
      case DioErrorType.DEFAULT:
        error = dioError.error != null
            ? "${dioError.error}"
            : "Looks like you don't have connection please check and restart";
        break;
    }

    return AppError(AppErrorType.network, '$error');
  }
}

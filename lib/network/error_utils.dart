import 'package:dio/dio.dart';

String onError(error, {url, body, trace}) {
  String message = "";
  if (error is DioError) {
    DioError dioError = error;
    switch (dioError.type) {
      case DioErrorType.CANCEL:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.DEFAULT:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.RESPONSE:
        message =
        "Received invalid status code: ${dioError.response.statusCode}";
        break;
      case DioErrorType.SEND_TIMEOUT:
        message = "Send timeout in connection with API server";
        break;
    }
  } else {
    message = "Something wrong.";
  }
  print('$message, $error');
  return message;
}
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_verse/core/error/app_error_type.dart';

AppErrorType mapExceptionToErrorType(Object error) {
   final message = error.toString().toLowerCase();

  if (error is SocketException ||
      error is http.ClientException ||
      message.contains('failed host lookup') ||
      message.contains('socketexception') ||
      message.contains('no address associated with hostname')) {
    return AppErrorType.noInternet;
  }

  if (error is HttpException) {
    return AppErrorType.server;
  }

  if (error is FormatException) {
    return AppErrorType.somethingWentWrong;
  }

  return AppErrorType.somethingWentWrong;
}

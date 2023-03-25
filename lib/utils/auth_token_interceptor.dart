import 'package:dart_extensions/dart_extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:moviebooking/persistence/daos/user_data_dao.dart';

import '../data/model/movie_booking_model.dart';
import '../data/model/movie_booking_model_impl.dart';

class AuthTokenInterceptor extends InterceptorsWrapper {
  AuthTokenInterceptor();

  UserDataDao userDataDao = UserDataDao();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers['requires-token'] == 'false') {
      // if the request doesn't need token, then just continue to the next
      // interceptor
      options.headers.remove('requiresToken'); //remove the auxiliary header
      return handler.next(options);
    }

    var token = userDataDao.getUserData()?.token;
    debugPrint("Token =>> $token}");
    options.headers.addAll({
      'Authorization': 'Bearer ${(token.orEmpty)}',
      'Accept': 'application/json',
      'content-type': 'application/json',
    });
    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // <-- here you can handle 401 response, which is not related to token expiration, globally to all requests
    return handler.next(err);
  }
}

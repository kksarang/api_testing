import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:employee_directory/app/constants/strings.dart';
import 'package:employee_directory/app/data/result.dart';
import 'package:employee_directory/app/network/endpoints.dart';
import 'package:employee_directory/app/utils/toast.dart';

class NetworkClient {
  static const String GET = Strings.httpMethodGet;
  static const defaultLoadingMessage = Strings.defaultLoadingMessage;
  static Dio? dio;

  String _getBaseUrl() {
    return Endpoints.BASE_URL;
  }

  NetworkClient._internal() {
    if (dio == null) {
      dio = Dio(
        BaseOptions(
            baseUrl: _getBaseUrl(),
            responseType: ResponseType.plain,
            connectTimeout: 60000,
            receiveTimeout: 60000,
            sendTimeout: 60000),
      );
      _init();
    }
  }

  static final NetworkClient _instance = NetworkClient._internal();

  static NetworkClient getInstance() {
    return _instance;
  }

  void _init() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) async {
          _handleOnRequestToast();
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          _handleOnResponseToast();
          response.data = Result(response.data, response.statusCode!);
          return handler.next(response);
        },
        onError: (DioError error, handler) {
          _handleError(error);
          if (error.response != null && error.response?.data != null) {
            error.response!.data = Result(error.response!.data, error.response!.statusCode!);
          } else {
            throw Exception(Strings.somethingWentWrong);
          }
          return handler.next(error);
        },
      ),
    );
    dio?.interceptors.add(
      PrettyDioLogger(
          requestHeader: true, requestBody: true, responseBody: true, responseHeader: false, compact: false),
    );
  }

  static Future request(String url, {String method = NetworkClient.GET}) async {
    NetworkClient.getInstance();
    Response? response;
    try {
      response = await dio?.request(url);
      return response?.data;
    } on DioError catch (e) {
      return Result(e.response?.data, e.response!.statusCode!);
    }
  }

  DioError _handleError(DioError error) {
    String errorTypeInfo = Strings.otherError;
    switch (error.type) {
      case DioErrorType.connectTimeout:
        errorTypeInfo = Strings.connectionTimeout;
        return error;
      case DioErrorType.sendTimeout:
        errorTypeInfo = Strings.requestTimeout;
        break;
      case DioErrorType.receiveTimeout:
        errorTypeInfo = Strings.responseTimeout;
        break;
      case DioErrorType.response:
        errorTypeInfo = Strings.serviceException;
        break;
      case DioErrorType.cancel:
        errorTypeInfo = Strings.requestCancellation;
        break;
      case DioErrorType.other:
        errorTypeInfo = "${error.message}";
        break;
      default:
        break;
    }
    Toast.hide();
    return error;
  }

  void _handleOnRequestToast() {
    Toast.hide();
    Toast.loading(defaultLoadingMessage);
  }

  void _handleOnResponseToast() {
    Toast.hide();
  }
}

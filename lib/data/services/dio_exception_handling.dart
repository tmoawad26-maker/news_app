import 'package:dio/dio.dart';


  class DioExceptionHandling {
 static DioException mapDioException(Object ?error , RequestOptions requestOptions) {
    if(error is DioException) {
      return DioException(
         error: error.error,
          message: _handleDioError(error),
          response: error.response,
          type: error.type,
          requestOptions: error.requestOptions
      );
    }
    return DioException(requestOptions: requestOptions,
        error: error,
        type: DioExceptionType.unknown,
       message: "Received Unexpected data from the server"
    );
  }
 static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out. Please try again.';
      case DioExceptionType.sendTimeout:
        return 'Send timeout in alliance with API server.';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout in connection with API server.';
      case DioExceptionType.badCertificate:
        return 'Invalid security certificate detected.';
      case DioExceptionType.connectionError:
        return 'No internet connection detected.';
      case DioExceptionType.cancel:
        return 'Request to the server was cancelled.';

      case DioExceptionType.badResponse:
      // This triggers when the server responds with an error code (e.g., 400, 401, 500)
        return _handleStatusCode(error.response?.statusCode, error.response?.data);
      case DioExceptionType.unknown:
      default:
        return 'Something went wrong. Please try again later.';
    }
  }

 static  String _handleStatusCode(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return 'Bad request. ${data?['message'] ?? ''}';
      case 401:
        return 'Unauthorized access.';
      case 403:
        return 'Forbidden access.';
      case 404:
        return 'Requested resource not found.';
      case 500:
        return 'Internal server error. Please try later.';
      default:
        return 'Received invalid status code: $statusCode';
    }
  }


  }

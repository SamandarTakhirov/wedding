// // ignore_for_file: avoid_dynamic_calls

// import 'package:dio/dio.dart' hide Headers;

// import '../utils/logger.dart';
// import 'failure.dart';

// final class ServerError implements Exception {
//   ServerError.withDioError({required DioException error}) {
//     _handleError(error);
//   }

//   ServerError.withError({
//     required String message,
//     int? code,
//   }) {
//     _errorMessage = message;
//     _errorCode = code;
//   }

//   int? _errorCode;
//   String _errorMessage = '';

//   int get errorCode => _errorCode ?? 0;

//   String get message => _errorMessage;

//   void _handleError(
//     DioException error,
//   ) {
//     _errorCode = error.response?.statusCode ?? 500;
//     if (_errorCode == 500) {
//       if (error.response?.data is Map<String, dynamic>) {
//         _errorMessage = error.response!.data['data'].toString();
//       } else {
//         _errorMessage = 'Server error';
//       }
//       return;
//     }
//     if (_errorCode == 502) {
//       _errorMessage = 'Server down';
//       return;
//     }
//     if (_errorCode == 404) {
//       _errorMessage = 'Not Found';
//       return;
//     }
//     if (_errorCode == 413) {
//       _errorMessage = 'Request Entity Too Large';
//       return;
//     }
//     if (_errorCode == 401) {
//       _errorMessage = 'Token expired';
//       return;
//     }
//     if (_errorCode == 403) {
//       _errorMessage = 'Token expired';
//       return;
//     }
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//         _errorMessage = 'Connection timeout';
//       case DioExceptionType.sendTimeout:
//         _errorMessage = 'Connection timeout';
//       case DioExceptionType.receiveTimeout:
//         _errorMessage = 'Connection timeout';
//       case DioExceptionType.badResponse:
//         {
//           info('Error message badResponse: ${error.response?.data}');
//           if (error.response?.data is Map<String, dynamic>) {
//             _errorMessage = error.response!.data['data'].toString();
//           } else {
//             _errorMessage = error.response!.data['data'].toString();
//           }
//           break;
//         }
//       case DioExceptionType.cancel:
//         _errorMessage = 'Canceled';
//       case DioExceptionType.unknown:
//         _errorMessage = 'Something wrong';
//       case DioExceptionType.badCertificate:
//         _errorMessage = 'Bad certificate';
//       case DioExceptionType.connectionError:
//         _errorMessage = 'Connection error';
//     }
//     return;
//   }
// }

// extension ServerErrorExtension on ServerError {
//   bool get isTokenExpired => errorCode == 401;

//   ServerFailure get failure => ServerFailure(
//         message: message,
//         statusCode: errorCode,
//       );
// }

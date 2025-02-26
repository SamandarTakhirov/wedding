import 'package:dio/dio.dart';
import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/server_error.dart';
import '../../../../core/typedefs/typedefs.dart';

abstract class AuthService {
  Future<Either<Failure, Object?>> loginUser({
    required String login,
    required String password,
  });
}

class AuthServiceImpl implements AuthService {
  AuthServiceImpl({Dio? dio})
      : dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'http://51.21.219.241:8081',
                headers: {
                  'Content-Type': 'application/json',
                },
              ),
            );

  final Dio dio;

  @override
  Future<Either<Failure, Object?>> loginUser({required String login, required String password}) async {
    try {
      final response = await dio.post<DioResponse>(
        '/v1/auth/login',
        data: {
          'login': login,
          'password': password,
        },
      );
      print('Javob: ${response.data}');
      return Right(response.data);
    } on DioException catch (error, stacktrace) {
      print('DioException: $error, stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      print('Exception: $error, stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }
}

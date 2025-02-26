import 'package:http/http.dart' as http;

import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';

abstract class AuthService {
  Future<Either<Failure, Object?>> loginUser({
    required String login,
    required String password,
  });
}

class AuthServiceImpl implements AuthService {
  AuthServiceImpl();

  // ..httpClientAdapter = IOHttpClientAdapter(
  //   createHttpClient: () => io.HttpClient()..badCertificateCallback = (cert, host, post) => true,
  //   validateCertificate: (cert, host, post) => true,
  // );

  @override
  Future<Either<Failure, Object?>> loginUser({required String login, required String password}) async {
    print('object');
    try {
      final response = await http.post(
        Uri.http('51.21.219.241:8081', '/v1/auth/login'),
        body: {
          'login': login,
          'password': password,
        },
      );
      return Right(response.body);
    } catch (e) {
      rethrow;
    }
    // on DioException catch (error, stacktrace) {
    //   print('DioException: $error, stacktrace: $stacktrace');
    //   return Left(ServerError.withDioError(error: error).failure);
    // } on Exception catch (error, stacktrace) {
    //   print('Exception: $error, stacktrace: $stacktrace');
    //   return Left(ServerError.withError(message: error.toString()).failure);
    // }
  }
}

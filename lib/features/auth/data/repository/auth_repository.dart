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


  @override
  Future<Either<Failure, Object?>> loginUser({required String login, required String password}) async {
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
  }
}

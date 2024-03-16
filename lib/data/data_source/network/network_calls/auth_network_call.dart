import '../../../../domain/models/auth/login_response.dart';
import '../../../../domain/models/auth/register_input.dart';
import '../base_client/base_client.dart';
import '../../../../domain/models/auth/auth_model.dart';

class AuthNetworkModule {
  BaseClientApi baseClient = BaseClientApi();

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    var res = await baseClient.post(
      "user_login.php",
      {
        "login": {
          "user_name": email,
          "password": password,
        }
      },
    );
    return LoginResponse.fromJson(res);
  }

  Future<AuthModel> register({
    required RegisterInput registerInput,
  }) async {
    var res = await baseClient.post(
      "user_register.php",
      {"ragister": registerInput.toJson()},
    );
    return AuthModel.fromJson(res);
  }

  Future<AuthModel> forgotPassword({
    required String email,
  }) async {
    var res = await baseClient.post(
      "user_forgate_password.php",
      {
        "forgate_pass": {"user_email": email},
      },
    );
    return AuthModel.fromJson(res);
  }
}

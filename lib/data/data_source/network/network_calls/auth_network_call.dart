import 'package:agriapp/data/data_source/local/preference_util/preference_utils.dart';

import '../../../../domain/models/auth/auth_model.dart';
import '../../../../domain/models/auth/login_response.dart';
import '../../../../domain/models/auth/register_input.dart';
import '../base_client/base_client.dart';

class AuthNetworkModule {
  static BaseClientApi baseClient = BaseClientApi();

  static Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    var res = await baseClient.post(
      "user_login.php",
      {
        "login": {
          "user_email": email,
          "password": password,
        }
      },
    );
    return LoginResponse.fromJson(res);
  }

  static Future<AuthModel> register({
    required RegisterInput registerInput,
  }) async {
    var res = await baseClient.post(
      "user_register.php",
      {"ragister": registerInput.toJson()},
    );
    return AuthModel.fromJson(res);
  }

  static Future<AuthModel> forgotPassword({
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

  static Future<AuthModel> changePassword({
    required String password,
  }) async {
    var res = await baseClient.post(
      "user_change_passward.php",
      {
        "user_change_passward": {
          "user_id": PreferenceUtils.getString(PreferenceUtils.USERID),
          "user_new_pass": password
        },
      },
    );
    return AuthModel.fromJson(res);
  }

  static Future<Map<String, dynamic>> contactUs() async {
    var res = await baseClient.get(
      api: "contact_us.php",
    );
    return res;
  }

  static Future<Map<String, dynamic>> getTermAndCondition() async {
    var res = await baseClient.get(
      api: "seller_terms_and _conditions.php",
    );
    return res;
  }

  static Future<Map<String, dynamic>> aboutUs() async {
    var res = await baseClient.get(
      api: "about_us.php",
    );
    return res;
  }
}

import 'package:agriapp/data/data_source/local/preference_util/preference_utils.dart';
import 'package:agriapp/domain/models/address/address_input.dart';

import '../../../../domain/models/model/shipping_address_response.dart';
import '../base_client/base_client.dart';

class AppNetworkCall {
  static BaseClientApi baseClient = BaseClientApi();

  static Future<ShippingAddressResponse> shippingAddress() async {
    final res = await baseClient.post(
      "user_billing_address.php",
      {
        "user_billing_address": {
          "user_id": PreferenceUtils.getString(PreferenceUtils.USERID)
        },
      },
    );

    return ShippingAddressResponse.fromJson(res);
  }

  static Future<Map<String, dynamic>> addAddress({
    required AddressInput addressInput,
  }) async {
    final res = await baseClient.post(
      "add_shipping_address.php",
      {
        "shipping_address": addressInput.toJson(),
      },
    );

    return res;
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

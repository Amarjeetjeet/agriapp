import '../../../../domain/models/model/shipping_address_response.dart';
import '../base_client/base_client.dart';

class AddressNetworkModule {
  BaseClientApi baseClient = BaseClientApi();

  Future<ShippingAddressResponse> shippingAddress() async {
    // return ShippingAddressResponse.fromJson({
    //   "user_billing_address": {
    //     "billing_first_name": "bhavesh",
    //     "billing_last_name": "jadav",
    //     "billing_email": "bhjadav24888@gmail.com",
    //     "billing_phone": "986543210",
    //     "billing_company": "B&B Company",
    //     "billing_address_1": "c g road",
    //     "billing_address_2": "",
    //     "billing_city": "Ahmedabad",
    //     "billing_postcode": "380007",
    //     "billing_state": "GJ",
    //     "billing_country": "IN"
    //   },
    //   "status": true
    // });

    final res = await baseClient.post(
      "user_billing_address.php",
      {
        "user_billing_address": {"user_id": "2"},
      },
    );

    return ShippingAddressResponse.fromJson(res);
  }
}

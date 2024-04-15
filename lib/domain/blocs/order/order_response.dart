class OrderCreateResponse {
  int? orderId;
  String? messege;
  bool? status;

  OrderCreateResponse({this.orderId, this.messege, this.status});

  OrderCreateResponse.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    messege = json['messege'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['messege'] = messege;
    data['status'] = status;
    return data;
  }
}

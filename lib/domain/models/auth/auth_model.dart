class AuthModel {
  int? iD;
  String? firstName;
  String? lastName;
  String? userName;
  String? message;
  bool? status;

  AuthModel(
      {this.iD,
        this.firstName,
        this.lastName,
        this.userName,
        this.message,
        this.status});

  AuthModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['user_name'] = userName;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

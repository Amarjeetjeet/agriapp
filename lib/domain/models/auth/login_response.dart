class LoginResponse {
  LoginUser? loginUser;
  String? message;
  bool? status;

  LoginResponse({this.loginUser, this.message, this.status});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    loginUser = json['login_user'] != null
        ? LoginUser.fromJson(json['login_user'])
        : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (loginUser != null) {
      data['login_user'] = loginUser!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }

  @override
  String toString() {
    return 'LoginResponse{loginUser: $loginUser, message: $message, status: $status}';
  }
}

class LoginUser {
  String? id;
  String? userLogin;
  String? userNiceName;
  String? userEmail;
  String? displayName;

  LoginUser(
      {this.id,
        this.userLogin,
        this.userNiceName,
        this.userEmail,
        this.displayName});

  LoginUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userLogin = json['user_login'];
    userNiceName = json['user_nicename'];
    userEmail = json['user_email'];
    displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_login'] = userLogin;
    data['user_nicename'] = userNiceName;
    data['user_email'] = userEmail;
    data['display_name'] = displayName;
    return data;
  }

  @override
  String toString() {
    return 'LoginUser{id: $id, userLogin: $userLogin, userNiceName: $userNiceName, userEmail: $userEmail, displayName: $displayName}';
  }
}

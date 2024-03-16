class RegisterInput {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  RegisterInput(
      {this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.password});

  RegisterInput.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

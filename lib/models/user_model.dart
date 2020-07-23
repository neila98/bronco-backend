class User {
  String email;
  String password;

  User({this.email, this.password});
  User.fromJson(Map<String, dynamic> json)
      : this(
            email: json['email'].toString(),
            password: json['password'].toString());

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

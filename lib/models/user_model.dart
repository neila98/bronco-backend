class User {
  String email;
  String password;
  String fname;
  String surname;

  User({
    this.email,
    this.password,
    this.fname,
    this.surname,
  });

  User.copy(User from)
      : this(
          email: from.email,
          password: from.password,
          fname: from.fname,
          surname: from.surname,
        );

  User.fromJson(Map<String, dynamic> json)
      : this(
          email: json['email'].toString(),
          password: json['password'].toString(),
          fname: json['fname'],
          surname: json['surname'],
        );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'fname': fname,
        'surname': surname,
      };
}

class User {

  User({this.name, this.email, this.idade, this.password});

  String name;
  String email;
  String idade;
  String password;

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['email'] = this.email;
    data['idade'] = this.idade;
    data['password'] = this.password;

    return data;
  }

}
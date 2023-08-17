import 'dart:convert';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String avatar;
  final String email;

  User(this.id, this.firstName, this.lastName, this.avatar, this.email);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_mame': lastName,
      'avatar': avatar,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map["id"] as int,
      map["first_name"] as String,
      map["last_name"] as String,
      map["avatar"] as String,
      map["email"] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(Map<String, dynamic> source) => User.fromMap(source);
}

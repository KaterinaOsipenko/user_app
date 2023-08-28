// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String avatar;
  final String email;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      firstName: json["first_name"] as String,
      lastName: json["last_name"] as String,
      avatar: json["avatar"] as String,
      email: json["email"] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "avatar": avatar,
      "email": email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"] as int,
      firstName: map["first_name"] as String,
      lastName: map["last_name"] as String,
      avatar: map["avatar"] as String,
      email: map["email"] as String,
    );
  }

  String toJson() => json.encode(toMap());
}

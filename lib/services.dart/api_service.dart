import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:user_app/models/user.dart';
import 'package:user_app/utilities/constants.dart';

class ApiService {
  final client = Get.put(Dio());

  Future<List<User>> getUsers() async {
    try {
      final response = await client.get(apiUrl);
      if (response.statusCode == 200) {
        var data = response.data["data"] as List;
        return parseUsers(data);
      } else {
        throw Exception(failedToLoadUsersException);
      }
    } catch (e) {
      throw Exception(failedToLoadUsersException);
    }
  }

  List<User> parseUsers(List response) {
    return response.map((json) => User.fromJson(json)).toList();
  }
}

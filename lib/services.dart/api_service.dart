import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:user_app/models/user.dart';
import 'package:user_app/utilities/constants.dart';

class ApiService {
  final client = Get.put(Dio());

  Future<List<User>> getUsers(int page) async {
    try {
      final response =
          await client.get(apiUrl, queryParameters: {"page": page});
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

  Future<User> getUser(int id) async {
    try {
      final response = await client.get('$apiUrl$id');
      if (response.statusCode == 200) {
        var data = response.data["data"];

        return parseUser(data);
      } else {
        throw Exception(failedToLoadUsersException);
      }
    } catch (e) {
      throw Exception(failedToLoadUsersException);
    }
  }

  User parseUser(var response) {
    return User.fromJson(response);
  }

  List<User> parseUsers(List response) {
    return response.map((json) => User.fromJson(json)).toList();
  }
}

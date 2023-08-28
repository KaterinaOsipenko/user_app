import 'package:get/get.dart';
import 'package:user_app/models/user.dart';
import 'package:user_app/utilities/constants.dart';

class ApiService extends GetConnect {
  Future<List<User>> getUsers(int page) async {
    print("api");
    try {
      final response = await get('$apiUrl?page=$page');
      if (response.statusCode == 200) {
        var data = response.body["data"] as List;
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
      final response = await get('$apiUrl$id');
      if (response.statusCode == 200) {
        var data = response.body["data"];
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

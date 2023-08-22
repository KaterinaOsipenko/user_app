import 'package:get/get.dart';
import 'package:user_app/models/status.dart';
import 'package:user_app/models/user.dart';
import 'package:user_app/services.dart/api_service.dart';

class CardsController extends GetxController {
  final users = List<User>.empty().obs;

  var status = Status.done.obs;

  ApiService apiService = Get.put(ApiService());

  void getUsers() async {
    status(Status.loadind);
    try {
      users.addAll(await apiService.getUsers());
      status(Status.done);
    } catch (e) {
      status(Status.error);
    }
  }

  Future<User> getUser(int id) async {
    status(Status.loadind);
    var user;
    try {
      user = await apiService.getUser(id);
      status(Status.done);
    } catch (e) {
      status(Status.error);
    } finally {
      status(Status.done);
    }
    return user;
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}

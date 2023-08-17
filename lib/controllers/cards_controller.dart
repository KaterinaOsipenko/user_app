import 'package:get/get.dart';
import 'package:user_app/models/status.dart';
import 'package:user_app/models/user.dart';
import 'package:user_app/services.dart/api_service.dart';

class CardsController extends GetxController {
  final users = List<User>.empty().obs;

  var status = Status.done.obs;

  ApiService apiService = Get.put(ApiService());

  Future<void> getUsers() async {
    print('Controller');
    status(Status.loadind);
    try {
      users.addAll(await apiService.getUsers());
      print('Contr oller');
      print(users.first);
      status(Status.done);
    } catch (e) {
      status(Status.error);
    }
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:user_app/models/status.dart';
import 'package:user_app/models/user.dart';
import 'package:user_app/services/api_service.dart';

class CardsController extends GetxController {
  final users = List<User>.empty().obs;

  var status = Status.done.obs;

  var page = 1;

  ScrollController scrollContoller = ScrollController();

  ApiService apiService = Get.put(ApiService());

  void getUsers() async {
    status(Status.loadind);
    try {
      users.addAll(await apiService.getUsers(page));
      status(Status.done);
    } catch (e) {
      status(Status.error);
    }
  }

  void loadMore() async {
    scrollContoller.addListener(() {
      if (scrollContoller.position.maxScrollExtent ==
          scrollContoller.position.pixels) {
        page = page + 1;
        getUsers();
      }
    });
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
    loadMore();
    super.onInit();
  }
}

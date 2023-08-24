import 'package:get/get.dart';
import 'package:user_app/presentation/controllers/cards_controller.dart';

class CardsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardsController>(() => CardsController());
  }
}

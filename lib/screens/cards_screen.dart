import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controllers/cards_controller.dart';
import 'package:user_app/models/status.dart';
import 'package:user_app/widgets/card_item.dart';
import 'package:user_app/widgets/error_user_widget.dart';

class CardsScreen extends StatelessWidget {
  final CardsController cardsController = Get.put(CardsController());
  CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => cardsController.status == Status.loadind
              ? const Center(child: CircularProgressIndicator())
              : cardsController.status == Status.error
                  ? ErrorUserWidget()
                  : ListView.builder(
                      itemCount: cardsController.users.length,
                      itemBuilder: (context, index) {
                        return CardItem(user: cardsController.users[index]);
                      },
                    ),
        ),
      ),
    );
  }
}

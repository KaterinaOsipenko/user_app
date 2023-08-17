import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controllers/cards_controller.dart';
import 'package:user_app/utilities/constants.dart';

class ErrorUserWidget extends StatelessWidget {
  final CardsController cardsController = Get.find();
  ErrorUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(failedToLoadUserMsg),
          FilledButton(
            onPressed: () {
              cardsController.getUsers();
            },
            child: const Text(tryAgainError),
          ),
        ],
      ),
    );
  }
}

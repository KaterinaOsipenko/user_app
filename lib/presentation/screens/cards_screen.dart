// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:user_app/presentation/controllers/cards_controller.dart';
import 'package:user_app/models/status.dart';
import 'package:user_app/utilities/constants.dart';
import 'package:user_app/presentation/widgets/card_item.dart';
import 'package:user_app/presentation/widgets/error_user_widget.dart';

class CardsScreen extends GetView<CardsController> {
  CardsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: SafeArea(
        child: Obx(
          () => controller.status == Status.loadind
              ? const Center(child: CircularProgressIndicator())
              : controller.status == Status.error
                  ? ErrorUserWidget()
                  : ListView.builder(
                      controller: controller.scrollContoller,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        return CardItem(user: controller.users[index]);
                      },
                    ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controllers/cards_controller.dart';
import 'package:user_app/models/status.dart';
import 'package:user_app/models/user.dart';
import 'package:user_app/utilities/constants.dart';
import 'package:user_app/widgets/error_user_widget.dart';

class CardDetails extends StatelessWidget {
  final User user;
  final CardsController cardsController = Get.find();
  CardDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: SafeArea(
        child: Center(
          child: cardsController.status == Status.loadind
              ? const CircularProgressIndicator()
              : cardsController.status == Status.error
                  ? ErrorUserWidget()
                  : SizedBox(
                      height: size.height * 0.5,
                      width: size.width * 0.9,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.05,
                            horizontal: size.width * 0.05,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: 75,
                                  backgroundImage: NetworkImage(
                                    user.avatar,
                                  ),
                                ),
                              ),
                              Text(
                                'Id: ${user.id} ',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'Name: ${user.firstName} ${user.lastName}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'Email: ${user.email}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:user_app/controllers/cards_controller.dart';
import 'package:user_app/models/user.dart';
import 'package:user_app/screens/card_details.dart';

class CardItem extends StatelessWidget {
  final User user;
  CardsController cardsController = Get.find();
  CardItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  void onSelected() async {
    Get.to(CardDetails(user: await cardsController.getUser(user.id)));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onSelected,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
          horizontal: size.width * 0.01,
        ),
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
          horizontal: size.width * 0.01,
        ),
        height: size.height / 6,
        child: Card(
          elevation: 5,
          color: Colors.grey.shade200,
          child: Row(
            children: [
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: user.avatar,
              ),
              Container(
                margin: EdgeInsetsDirectional.symmetric(
                  vertical: size.height * 0.01,
                  horizontal: size.width * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${user.firstName} ${user.lastName}',
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      user.email,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

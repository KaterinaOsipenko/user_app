import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:user_app/models/user.dart';

class CardItem extends StatelessWidget {
  final User user;
  const CardItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          CircleAvatar(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: user.avatar,
            ),
          ),
          Column(
            children: [
              Text('${user.firstName} ${user.lastName}'),
              Text(user.email),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advance/core/theming/colors.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: ColorsManager.gray,
          radius: 30,
          backgroundImage: AssetImage("assets/images/google.jpg"),
        ),
        CircleAvatar(
          backgroundColor: ColorsManager.gray,
          radius: 30,
          backgroundImage: AssetImage("assets/images/facebook.jpg"),
        ),
        CircleAvatar(
          backgroundColor: ColorsManager.gray,
          radius: 30,
          backgroundImage: AssetImage("assets/images/apple.jpg"),
        )
      ],
    );
  }
}

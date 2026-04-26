
import 'package:flutter/material.dart';

class BackgroundSignup extends StatelessWidget {
  const BackgroundSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      alignment: Alignment.topCenter,
      // height: 283,
      // width: 550,
      "asset/images/background_signup.png",
      fit: BoxFit.cover,
    );
  }
}

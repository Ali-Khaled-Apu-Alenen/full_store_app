import 'package:flutter/material.dart';

class LongBackground extends StatelessWidget {
  const LongBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("asset/images/background_long.png", fit: BoxFit.cover);
  }
}

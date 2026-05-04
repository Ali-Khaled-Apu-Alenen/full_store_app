import 'package:ali_store/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class VerifyCodeTestDetails extends StatelessWidget {
  const VerifyCodeTestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This app is still under development and testing\n And this essue will be fixed soon as we add email verification system,\n Thank you for your patience',
          textAlign: TextAlign.center,
          style: TextStyles.font16SimiBoldPrimary,
        ),
      ),
    );
  }
}

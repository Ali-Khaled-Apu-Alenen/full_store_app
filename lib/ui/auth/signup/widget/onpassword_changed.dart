import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnpasswordChanged extends StatefulWidget {
  final bool hasMinLength;
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumber;
  final bool hasSpecialChar;

  const OnpasswordChanged({
    super.key,
    required this.hasMinLength,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasNumber,
    required this.hasSpecialChar,
  });

  @override
  State<OnpasswordChanged> createState() => _OnpasswordChangedState();
}

class _OnpasswordChangedState extends State<OnpasswordChanged> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "signUp.onPasswordChanged.At least 8 characters",
          style: TextStyle(
            color: widget.hasMinLength ? Colors.grey : Colors.black,
            decoration: widget.hasMinLength
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ).tr(),
        Text(
          "signUp.onPasswordChanged.At least one uppercase letter",
          style: TextStyle(
            color: widget.hasUppercase ? Colors.grey : Colors.black,
            decoration: widget.hasUppercase
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ).tr(),
        Text(
          "signUp.onPasswordChanged.At least one lowercase letter",
          style: TextStyle(
            color: widget.hasLowercase ? Colors.grey : Colors.black,
            decoration: widget.hasLowercase
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ).tr(),
        Text(
          "signUp.onPasswordChanged.At least one number",
          style: TextStyle(
            color: widget.hasNumber ? Colors.grey : Colors.black,
            decoration: widget.hasNumber
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ).tr(),
        Text(
          "signUp.onPasswordChanged.At least one special character",
          style: TextStyle(
            color: widget.hasSpecialChar ? Colors.grey : Colors.black,
            decoration: widget.hasSpecialChar
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ).tr(),
      ],
    );
  }
}
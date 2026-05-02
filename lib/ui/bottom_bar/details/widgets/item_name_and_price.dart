import 'package:advanced_store_project/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ItemNameAndPrice extends StatelessWidget {
  final String name;
  final String price;
  const ItemNameAndPrice({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        Text(name, style: TextStyles.font20SimiBold),
        const Spacer(),
        Container(
          margin: EdgeInsets.only(top: 12, right: 20, left: 20),
          child: Text("\$$price", style: TextStyles.font16SimiBoldPrimary),
        ),
      ],
    );
  }
}

import 'package:ali_store/ui/bottom_bar/profile/setting/widget/account_card.dart';
import 'package:ali_store/ui/bottom_bar/profile/widget/profile_card_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Account", textAlign: TextAlign.left),
            // SizedBox(height: 20),
            AccountCard(),
            SizedBox(height: 20),
            Container(color: Colors.black, width: 343, height: 2),
            SizedBox(height: 20),
            Text("Setting"),
            ProfileCardDetails(
              onTapAction: () {},
              assetImage: "asset/svgs/notifications.svg",
              titleText: "Notifications",
            ),
            ProfileCardDetails(
              onTapAction: () {},
              assetImage: "asset/svgs/language.svg",
              titleText: "App Language",
            ),
            ProfileCardDetails(
              onTapAction: () {},
              assetImage: "asset/svgs/help_center.svg",
              titleText: "Help Center",
            ),
          ],
        ),
      ),
    );
  }
}

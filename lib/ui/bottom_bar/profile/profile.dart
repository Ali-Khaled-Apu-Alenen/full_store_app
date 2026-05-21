import 'package:ali_store/core/constatnt/image_Assets.dart';
import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/ui/bottom_bar/profile/widget/profile_card_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://imgs.search.brave.com/P-gPpVuRsayhBqMhHiubgE-nMRZ_VfX9-yQmwTyrtBk/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy90/aHVtYi82LzZiL0xp/b25lbF9NZXNzaV9X/aGl0ZV9Ib3VzZV8y/MDI2XyUyODN4NF9j/cm9wcGVkJTI5Lmpw/Zy8yNTBweC1MaW9u/ZWxfTWVzc2lfV2hp/dGVfSG91c2VfMjAy/Nl8lMjgzeDRfY3Jv/cHBlZCUyOS5qcGc_/dXRtX3NvdXJjZT1l/bi53aWtpcGVkaWEu/b3JnJmFtcDt1dG1f/Y2FtcGFpZ249cGFy/c2VyJmFtcDt1dG1f/Y29udGVudD10aHVt/Ym5haWw",
                  ),
                ),
              ),
              Text("Welcome"),
              Text("ali@gmail.com"),
              ProfileCardDetails(
                onTapAction: () {},
                assetImage: "asset/svgs/profile.svg",
                titleText: "profile",
              ),
              ProfileCardDetails(
                onTapAction: () {
                  Navigator.pushNamed(context, RoutesName.setting);
                },
                assetImage: "asset/svgs/setting.svg",
                titleText: "setting",
              ),
              ProfileCardDetails(
                onTapAction: () {},
                assetImage: "asset/svgs/mail.svg",
                titleText: "mail",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/styles/font_weights.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:ali_store/ui/bottom_bar/home/widget/app_bar_notification_icon.dart';
import 'package:ali_store/ui/bottom_bar/home/widget/card_discount.dart';
import 'package:ali_store/ui/bottom_bar/home/widget/card_view.dart';
import 'package:ali_store/ui/bottom_bar/home/widget/featured_list_view.dart';
import 'package:ali_store/ui/bottom_bar/home/widget/home_card_dots.dart';
import 'package:ali_store/ui/bottom_bar/home/widget/most_popular_list_view.dart';
import 'package:ali_store/ui/bottom_bar/home/widget/search_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  // void initState() {
  //   FirebaseMessaging.instance.getToken().then((token) {
  //     print("FCM Token: $token");
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return 
   SafeArea(
        child: Material(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBarNotificationIcon(),
                SizedBox(height: 18),
                SearchBarCostum(searchController: TextEditingController()),
                SizedBox(height: 18),
                CardViewHome(),
                SizedBox(height: 8),
                HomeCardDots(),
                SizedBox(height: 18),
                Row(
                  children: [
                    SizedBox(width: 18),
                    Text("home.featured".tr(), style: TextStyles.font16SimiBold),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text("home.see all".tr(), style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                FeaturedListView(),
                SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(width: 18),
                    Text("home.most popular".tr(), style: TextStyles.font16SimiBold),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text("home.see all".tr(), style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                MostPopularListView(),
              ],
            ),
          ),
        ),
      );
    
  }
}

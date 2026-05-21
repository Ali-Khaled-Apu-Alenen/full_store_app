import 'package:ali_store/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:ali_store/ui/bottom_bar/home/widget/card_discount.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardViewHome extends StatefulWidget {
  const CardViewHome({super.key});

  @override
  _CardViewHomeState createState() => _CardViewHomeState();
}

class _CardViewHomeState extends State<CardViewHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 135.h,
      child: PageView(
        onPageChanged: (index) {
        context.read<HomeBloc>().add(HomeEvent.dotsChanging(index));
        },
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: context.locale.languageCode == "ar" 
                ? EdgeInsets.only(left: 8.w)
                : EdgeInsets.only(right: 8.w),
            child: CardDiscount(
              text1: "home.cardview.Get Winter Discount",
              text2: "home.cardview.20% OFF",
              text3: "home.cardview.for children",
              isImageAsset: true,
              link: "asset/images/children.png",
            ),
          ),
          Container(
            margin:context.locale.languageCode == "ar" 
                ? EdgeInsets.only(left: 8.w)
                : EdgeInsets.only(right: 8.w),
            child: CardDiscount(
              text1: "home.cardview.Discount for electronics",
              text2: "home.cardview.30% OFF",
              text3: "home.cardview.for electronics",
              isImageAsset: true,
              link: "asset/images/laptop.png",
            ),
          ),
          Container(
            child: CardDiscount(
              text1: "home.cardview.Fast Delevery Food",
              text2: "home.cardview.Free shipping",
              text3: "home.cardview.Delivery",
              isImageAsset: true,
              link: "asset/images/snacks.png",
            ),
          ),
        ],
      ),
    );
  }
}

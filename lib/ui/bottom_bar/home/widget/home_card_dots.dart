import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCardDots extends StatefulWidget {
  const HomeCardDots({super.key});

  @override
  _HomeCardDotsState createState() => _HomeCardDotsState();
}

class _HomeCardDotsState extends State<HomeCardDots> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final current = state.maybeWhen(
          dotsChanging: (index) => index,

          orElse: () => 0,
        );
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(3, (index) {
              return AnimatedContainer(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: current == index
                      ? HomeColors.primaryColor
                      : AppColors.darkGrey,
                ),
                duration: Duration(milliseconds: 500),
                width: current == index ? 20.w : 8.w,
                height: 8.h,
              );
            }),
          ],
        );
      },
    );
  }
}

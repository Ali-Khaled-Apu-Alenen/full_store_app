import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/core/functions/build_category_image.dart';
import 'package:ali_store/core/styles/font_weights.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:ali_store/ui/bottom_bar/details/details_page.dart';
import 'package:ali_store/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:ali_store/ui/bottom_bar/home/logic/model/items_response_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostPopularListView extends StatefulWidget {
  const MostPopularListView({super.key});

  @override
  State<MostPopularListView> createState() => _MostPopularListViewState();
}

class _MostPopularListViewState extends State<MostPopularListView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(HomeEvent.getItems());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isArab = context.locale.languageCode == Languages.arabic;
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(
          initial: () => true,
          getItemsLoading: () => true,
          getItemsSuccess: (_) => true,
          getItemsError: () => true,
          orElse: () => false, // ignore dots changes and favorite changes
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => SizedBox.shrink(),

          getItemsLoading: () {
            return Center(
              child: CircularProgressIndicator(color: HomeColors.primaryColor),
            );
          },
          getItemsSuccess: (ItemsResponseData data) {
            final categories = data.data;
            return Container(
            
              margin: EdgeInsets.only(left: 18.w),
              width: 410.w,
              height: 142.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(item: categories[index]),
                        ),
                      );
                    },
                    child: Container(
                        decoration: BoxDecoration(
                // border: Border.all(color: Colors.grey, width: 1.w,),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
                      margin: EdgeInsets.only(right: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 99.h,
                            width: 126.w,
                            child: Stack(
                              children: [
                                Hero(
                                  tag: "category_image_${categories[index].item_id}",
                                  child: buildCategoryImage(
                                    categories[index].item_image,
                                    categories[index].item_id,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 24.w,
                                    height: 24.h,
                                    margin: EdgeInsets.only(top: 8.h, right: 8.w),
                                    child: BlocBuilder<HomeBloc, HomeState>(
                                      builder: (context, state) {
                                        return InkWell(
                                          onTap: () {
                                            final homeBloc = context
                                                .read<HomeBloc>();
                                            final isCurrentlyFavorited =
                                                homeBloc.isItemFavorited(
                                                  categories[index].item_id,
                                                );
                                            homeBloc.add(
                                              HomeEvent.changeFavoriteItem(
                                                categories[index].item_id,
                                                !isCurrentlyFavorited,
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            context
                                                    .read<HomeBloc>()
                                                    .isItemFavorited(
                                                      categories[index].item_id,
                                                    )
                                                ? "asset/images/favorit_filled.png"
                                                : "asset/images/favorate.png",
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            isArab
                                ? categories[index].item_name_ar
                                : categories[index].item_name,
                            style: TextStyles.font14SimiBoldBlack,
                          ),
                          Text(
                            "${categories[index].item_price.toString()}\$",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              color: HomeColors.primaryColor,
                              fontWeight: FontWeights.semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          getItemsError: () {
            return Center(child: Text("items.NO Internet Connection".tr()));
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}

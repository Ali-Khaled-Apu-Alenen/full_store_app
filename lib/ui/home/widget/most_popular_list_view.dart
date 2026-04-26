import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:advanced_store_project/core/styles/font_weights.dart';
import 'package:advanced_store_project/core/styles/text_styles.dart';
import 'package:advanced_store_project/ui/home/logic/bloc/home_bloc.dart';
import 'package:advanced_store_project/ui/home/logic/model/items_response_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';

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

  Widget _buildCategoryImage(String imageFileName) {
    final normalized = imageFileName.replaceAll('"', '').trim();
    final isSvg = normalized.toLowerCase().endsWith('.svg');
    if (isSvg) {
      final path = "asset/svgs/$normalized";
      return FutureBuilder<String>(
        future: rootBundle.loadString(path),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SvgPicture.string(snapshot.data!, fit: BoxFit.contain);
          }
          if (snapshot.hasError) {
            return SvgPicture.asset(
              "asset/svgs/background_store.svg",
              fit: BoxFit.contain,
            );
          }
          return const SizedBox.shrink();
        },
      );
    }
    return Image.asset("asset/images/$normalized", fit: BoxFit.contain);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(
          initial: () => true,
          getItemsLoading: () => true,
          getItemsSuccess: (_) => true,
          getItemsError: () => true,
          orElse: () => false, // ignore dots changes
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
              margin: EdgeInsets.only(left: 18),
              width: 410,
              height: 142,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 99,
                          width: 126,
                          child: Stack(
                            children: [
                              _buildCategoryImage(categories[index].item_image),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(top: 8, right: 8),
                                  child: Image.asset(
                                    "asset/images/favorit_filled.png",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          categories[index].item_name,
                          style: TextStyles.font14SimiBoldBlack,
                        ),
                        Text(
                          "40\$",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: HomeColors.primaryColor,
                            fontWeight: FontWeights.semiBold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
          getItemsError: () {
            return Center(child: Text("NO Internet Connection"));
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}

import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:advanced_store_project/core/styles/font_weights.dart';
import 'package:advanced_store_project/core/styles/text_styles.dart';
import 'package:advanced_store_project/ui/home/logic/bloc/home_bloc.dart';
import 'package:advanced_store_project/ui/home/logic/model/categorie_response_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeaturedListView extends StatefulWidget {
  FeaturedListView({Key? key}) : super(key: key);

  @override
  _FeaturedListViewState createState() => _FeaturedListViewState();
}

class _FeaturedListViewState extends State<FeaturedListView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(HomeEvent.getCategories());
    });
    super.initState();
  }

  Widget _buildCategoryImage(String imageFileName) {
    final isSvg = imageFileName.toLowerCase().endsWith('.svg');
    if (isSvg) {
      return Center(child: SvgPicture.asset("asset/svgs/$imageFileName", fit: BoxFit.contain));
    }
    return Center(child: Image.asset("asset/images/$imageFileName", fit: BoxFit.contain));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(
          initial: () => true,
          getCategoriesLoading: () => true,
          getCategoriesSuccess: (_) => true,
          getCategoriesError: () => true,
          orElse: () => false, // ignore dots changes
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => SizedBox.shrink(),
          getCategoriesLoading: () {
            return Center(
              child: CircularProgressIndicator(color: HomeColors.primaryColor),
            );
          },
          getCategoriesSuccess: (CategorieResponseData data) {
            final categories = data.data;
            return Container(
              margin: EdgeInsets.only(left: 18),
              width: 410,
              height: 142,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print(categories[index].id);
                      // TODO: Navigate to category details
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 99,
                            width: 126,
                            child: Stack(
                              children: [
                                _buildCategoryImage(categories[index].image),
                                // Align(
                                //   alignment: Alignment.topRight,
                                //   child: Container(
                                //     width: 24,
                                //     height: 24,
                                //     margin: EdgeInsets.only(top: 8, right: 8),
                                //     child: Image.asset(
                                //       "asset/images/favorit_filled.png",
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            categories[index].name,
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
                    ),
                  );
                },
              ),
            );
          },
          getCategoriesError: () {
            return Center(child: Text("NO Internet Connection"));
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}

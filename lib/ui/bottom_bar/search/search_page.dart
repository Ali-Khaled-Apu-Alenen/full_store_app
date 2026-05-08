import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:ali_store/ui/bottom_bar/details/details_page.dart';
import 'package:ali_store/ui/bottom_bar/home/widget/search_bar.dart';
import 'package:ali_store/ui/bottom_bar/items_page/custom_grid_view.dart';
import 'package:ali_store/ui/bottom_bar/search/logic/cubit/search_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchCubit>().emitSearchState();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale.languageCode == Languages.arabic;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, RoutesName.bottomBar),
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: SearchBarCostum(
                      searchController: TextEditingController(),
                      onChanged: (value) {
                        searchQuery = value;
                        context.read<SearchCubit>().searchItems(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                       Center(child: Text('Start searching...'.tr())),
                  gettingItems: () =>
                      const Center(child: CircularProgressIndicator()),
                  getItemsSuccess: (items) {
                    if (items.isEmpty) {
                      return Center(child: Text('No items found'.tr()));
                    }
                    return Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                searchQuery.isNotEmpty
                                    ? Text(
                                        "items.Results for:".tr(
                                          args: [searchQuery],
                                        ),
                                      )
                                    : const Text(""),
                                const Spacer(),
                                Text(
                                  " ${items.length} ${"items.items".tr()}",
                                  style: TextStyles.font16Medium,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: CustomScrollView(
                              slivers: [
                                SliverPadding(
                                  padding: const EdgeInsets.all(10),
                                  sliver: SliverGrid(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.7,
                                          // crossAxisSpacing: 10,
                                          // mainAxisSpacing: 10,
                                        ),
                                    delegate: SliverChildBuilderDelegate((
                                      context,
                                      index,
                                    ) {
                                      return CustomGridView(
                                        itemId: items[index].item_id,
                                        onPreased: () {
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).push(
                                            MaterialPageRoute(
                                              builder: (context) => DetailsPage(
                                                item: items[index],
                                              ),
                                            ),
                                          );
                                        },
                                        itemImage: items[index].item_image,
                                        itemName: isArabic 
                                            ? items[index].item_name_ar 
                                            : items[index].item_name,
                                        itemPrice: items[index].item_price
                                            .toString(),
                                      );
                                    },
                                    childCount: items.length,
                                  ),
                                ),
                            )],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  getItemsError: () =>
                      const Center(child: Text('Error loading items')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

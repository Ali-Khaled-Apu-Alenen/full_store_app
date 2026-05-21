import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:ali_store/ui/bottom_bar/home/widget/search_bar.dart';
import 'package:ali_store/ui/bottom_bar/items_page/item_favorites.dart';
import 'package:ali_store/ui/bottom_bar/items_page/items_grid_view.dart';
import 'package:ali_store/ui/bottom_bar/search/logic/cubit/search_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchCubit>().loadItems();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == Languages.arabic;

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
                      searchController: _searchController,
                      onChanged: (value) {
                        setState(() => searchQuery = value);
                        context.read<SearchCubit>().searchItems(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return state.when(
                    initial: () =>
                        Center(child: Text('Start searching...'.tr())),
                    gettingItems: () =>
                        const Center(child: CircularProgressIndicator()),
                    getItemsSuccess: (items, favoriteRevision) {
                      if (items.isEmpty) {
                        return Center(child: Text('No items found'.tr()));
                      }

                      final cubit = context.read<SearchCubit>();

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                if (searchQuery.isNotEmpty)
                                  Text(
                                    'items.Results for:'.tr(
                                      args: [searchQuery],
                                    ),
                                  ),
                                const Spacer(),
                                Text(
                                  ' ${items.length} ${'items.items'.tr()}',
                                  style: TextStyles.font16Medium,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ItemsGridView(
                              items: items,
                              isArabic: isArabic,
                              favorites: ItemFavorites.fromSearchCubit(cubit),
                              favoriteRevision: favoriteRevision,
                            ),
                          ),
                        ],
                      );
                    },
                    getItemsError: () => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Error loading items'.tr()),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () =>
                                context.read<SearchCubit>().loadItems(),
                            child: Text('Retry'.tr()),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

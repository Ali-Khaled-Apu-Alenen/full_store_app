import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/data/datasource/items_data.dart';
import 'package:ali_store/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:ali_store/ui/bottom_bar/items_page/item_favorites.dart';
import 'package:ali_store/ui/bottom_bar/items_page/items_horizontal_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostPopularListView extends StatefulWidget {
  const MostPopularListView({super.key});

  @override
  State<MostPopularListView> createState() => _MostPopularListViewState();
}

class _MostPopularListViewState extends State<MostPopularListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const HomeEvent.getItems());
    });
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == Languages.arabic;

    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current.maybeWhen(
        initial: () => true,
        getItemsLoading: () => true,
        getItemsSuccess: (_, __) => true,
        getItemsError: () => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const SizedBox.shrink(),
          getItemsLoading: () => Center(
            child: CircularProgressIndicator(color: HomeColors.primaryColor),
          ),
          getItemsSuccess: (data, favoriteRevision) {
            ItemsDataSource.items = data.data;
            return ItemsHorizontalListView(
              items: data.data,
              isArabic: isArabic,
              favorites: ItemFavorites.fromHomeBloc(context.read<HomeBloc>()),
              favoriteRevision: favoriteRevision,
            );
          },
          getItemsError: () =>
              Center(child: Text('items.NO Internet Connection'.tr())),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

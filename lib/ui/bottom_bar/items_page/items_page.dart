import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/core/functions/build_category_image.dart';
import 'package:ali_store/core/styles/font_weights.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:ali_store/ui/bottom_bar/details/details_page.dart';
import 'package:ali_store/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:ali_store/ui/bottom_bar/home/logic/model/items_response_data.dart';
import 'package:ali_store/ui/bottom_bar/items_page/custom_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemsPage extends StatelessWidget {
  final int categoryId;
  
  const ItemsPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    bool isArab=context.locale.languageCode == Languages.arabic;
    context.read<HomeBloc>().add(const HomeEvent.getItems());
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('items.Products'.tr(), style: TextStyles.font16SimiBold,))),
      body: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) => current.maybeWhen(
              orElse: () => false,
              getItemsLoading: () => true,
              getItemsSuccess: (items) => true,
              getItemsError: () => true,
            ),
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () =>  Center(child: Text('items.Error'.tr())),
                getItemsLoading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                getItemsError: () {
                  return  Center(child: Text('items.Error'.tr()));
                },
                getItemsSuccess: (ItemsResponseData items) {
                  List<Item> chosenItems = items.data.where((item) => item.items_categorie == categoryId).toList();
                  
                  if (chosenItems.isEmpty) {
                    return  Center(child: Text('No items found in this category'.tr()));
                  }
                  
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: chosenItems.length,
                        itemBuilder: (context, index) {
                          return CustomGridView(
                            onPreased: () {
                              Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(item: chosenItems[index]),
                        ),
                      );
                            },
                            itemImage: chosenItems[index].item_image,
                            itemName: isArab ? chosenItems[index].item_name_ar : chosenItems[index].item_name,
                            itemPrice: chosenItems[index].item_price.toString(), 
                          );
                        },
                      ),
                    ),
                  );
                },
              );
              
            },
          ),
        ],
      ),
    );
  }
}

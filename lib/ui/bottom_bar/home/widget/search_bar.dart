import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SearchBarCostum extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String)? onChanged;
  const SearchBarCostum({super.key, required this.searchController, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      // color: Colors.white,
      child: TextFormField(
        onChanged:onChanged,
        controller: searchController,
        decoration: InputDecoration(
          fillColor: HomeColors.lightGrey,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: tr("home.Search"),
        ),
      ),
    );
  }
}

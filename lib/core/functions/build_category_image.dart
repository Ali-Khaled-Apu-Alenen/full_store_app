  import 'package:advanced_store_project/core/networking/api_constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

  Widget buildCategoryImage(String imageFileName) {
    print("imageFileName: $imageFileName");
    final isSvg = imageFileName.toLowerCase().endsWith('.svg');
    final isJpg = imageFileName.toLowerCase().endsWith('.jpg');
    if (imageFileName.isEmpty) {
      return Center(child: Icon(Icons.error));
    } else if (isSvg) {
      return Center(child: SvgPicture.network("${ApiConstants.itemsImageUrl}$imageFileName", fit: BoxFit.contain));
    } else if (isJpg) {
      return Center(child: Image.network(
        "${ApiConstants.itemsImageUrl}$imageFileName", 
        fit: BoxFit.contain,
      ));
    }
    return Center(child: Image.network(
      "${ApiConstants.itemsImageUrl}$imageFileName", 
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Center(child: Icon(Icons.error));
      },
    ));
  }
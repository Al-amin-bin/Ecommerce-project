import 'package:ecommerce/Data/model/category_data.dart';
import 'package:flutter/material.dart';

import '../Utility/app_color.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryData, required this.onTap,
  });
  final CategoryData categoryData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap:onTap,
          child: Container(
            height: MediaQuery.of(context).size.width/5.5,
            width: MediaQuery.of(context).size.width/5,
            margin: const EdgeInsets.symmetric(horizontal: 8),

            padding:  EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(categoryData.categoryImg??'', height: 50,),
          ),
        ),
        Text(categoryData.categoryName?? "",style: TextStyle(color: AppColors.primaryColor,fontSize: 15),)
      ],
    );
  }
}
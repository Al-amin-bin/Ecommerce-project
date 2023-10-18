import 'package:ecommerce/Presentation/State_holders/category_controller.dart';
import 'package:ecommerce/Presentation/State_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/Presentation/UI/Screens/product_list_screen.dart';
import 'package:ecommerce/Presentation/UI/Widgets/cetagory_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductScreen extends StatefulWidget {
  const CategoryProductScreen({super.key});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Categories",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<CategoryController>(builder: (categoryController) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemCount: categoryController.categoryModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return FittedBox(
                      child: CategoryCard(
                    categoryData: categoryController.categoryModel.data![index],
                    onTap: () {
                      Get.to(()=>ProductListScreen(productId: categoryController.categoryModel.data![index].id!));
                    },
                  ));
                });
          }),
        ),
      ),
    );
  }
}

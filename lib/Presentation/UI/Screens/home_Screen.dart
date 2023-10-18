import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Presentation/State_holders/category_controller.dart';
import 'package:ecommerce/Presentation/State_holders/home_slider_controller.dart';
import 'package:ecommerce/Presentation/State_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/Presentation/State_holders/new_product_controller.dart';
import 'package:ecommerce/Presentation/State_holders/populur_product_controller.dart';
import 'package:ecommerce/Presentation/State_holders/special_product_controller.dart';
import 'package:ecommerce/Presentation/UI/Screens/category_product_screen.dart';
import 'package:ecommerce/Presentation/UI/Screens/product_list_screen.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:ecommerce/Presentation/UI/Utility/image_asset.dart';
import 'package:ecommerce/Presentation/UI/Widgets/cetagory_card.dart';
import 'package:ecommerce/Presentation/UI/Widgets/circular_icon_button.dart';
import 'package:ecommerce/Presentation/UI/Widgets/home_widgets/home_slider.dart';
import 'package:ecommerce/Presentation/UI/Widgets/home_widgets/section_header.dart';
import 'package:ecommerce/Presentation/UI/Widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAsset.craftyBayNavSVG),
            const Spacer(),
            CircularIconButton(() {}, Icons.person),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(() {}, Icons.call),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(() {}, Icons.notifications_active),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search"),
              ),
              const SizedBox(
                height: 12,
              ),
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if (sliderController.homeSliderProgress) {
                  return const SizedBox(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return HomeSlider(
                  sliders: sliderController.sliderModel.data ?? [],
                );
              }),
              const SizedBox(
                height: 12,
              ),
              SectionHeader(
                  onTap: () {
                    Get.find<MainBottomNavController>().changeScreen(1);
                  },
                  title: "All Categories"),
              SizedBox(
                height: 90,
                child: GetBuilder<CategoryController>(
                    builder: (categoryController) {
                  if (categoryController.categoryProgress) {
                    return const SizedBox(
                      height: 80,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return ListView.builder(
                      itemCount:
                          categoryController.categoryModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          categoryData:
                              categoryController.categoryModel.data![index],
                          onTap: () {
                            Get.to(()=> ProductListScreen(productId: categoryController.categoryModel.data![index].id!));
                          },
                        );
                      });
                }),
              ),
              SectionHeader(
                  onTap: () {
                    Get.to( ProductListScreen(productModel: Get.find<PopularProductController>().popularProductModel,));
                  },
                  title: "Popular"),
              SizedBox(
                height: 165,
                child: GetBuilder<PopularProductController>(
                    builder: (popularController) {
                  if (popularController.popularProductProgress) {
                    return const SizedBox(
                      height: 140,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return ListView.builder(
                      itemCount:
                          popularController.popularProductModel.data?.length ??
                              0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: popularController
                              .popularProductModel.data![index],
                        );
                      });
                }),
              ),
              SectionHeader(
                  onTap: () {
                    Get.to( ProductListScreen(productModel: Get.find<SpecialProductController>().specialProductModel,));
                  },
                  title: "Special"),
              SizedBox(
                height: 165,
                child: GetBuilder<SpecialProductController>(
                    builder: (specialController) {
                  if (specialController.specialProductInProgress) {
                    return const SizedBox(
                      height: 140,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return ListView.builder(
                      itemCount:
                          specialController.specialProductModel.data?.length ??
                              0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: specialController
                              .specialProductModel.data![index],
                        );
                      });
                }),
              ),
              SectionHeader(
                  onTap: () {
                    Get.to( ProductListScreen(productModel: Get.find<NewProductController>().newProductModel,));
                  },
                  title: "New"),
              SizedBox(
                height: 165,
                child:
                    GetBuilder<NewProductController>(builder: (newController) {
                  if (newController.newProductProgress) {
                    return const SizedBox(
                      height: 140,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return ListView.builder(
                      itemCount:
                          newController.newProductModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: newController.newProductModel.data![index],
                        );
                      });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

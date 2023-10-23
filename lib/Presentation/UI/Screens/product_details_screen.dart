import 'package:ecommerce/Data/model/product_details.dart';
import 'package:ecommerce/Presentation/State_holders/addTo_cart_controller.dart';
import 'package:ecommerce/Presentation/State_holders/product_details_controller.dart';
import 'package:ecommerce/Presentation/State_holders/review_list_controller.dart';
import 'package:ecommerce/Presentation/UI/Screens/review_screen.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:ecommerce/Presentation/UI/Widgets/ProductDetailsScreen_Widgets/custom_stepper.dart';
import 'package:ecommerce/Presentation/UI/Widgets/cart_screen_nav.dart';
import 'package:ecommerce/Presentation/UI/Widgets/ProductDetailsScreen_Widgets/product_details_slider.dart';
import 'package:ecommerce/Presentation/UI/Widgets/ProductDetailsScreen_Widgets/product_color_list.dart';
import 'package:ecommerce/Presentation/UI/Widgets/ProductDetailsScreen_Widgets/product_details_titleText.dart';
import 'package:ecommerce/Presentation/UI/Widgets/ProductDetailsScreen_Widgets/product_size_list.dart';
import 'package:ecommerce/Presentation/UI/Widgets/ProductDetailsScreen_Widgets/productNewnav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
    super.initState();
  }
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.productDetailsInProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ProductDetailsSlider(
                            imageList: [
                              productDetailsController.productDetails.img1!,
                              productDetailsController.productDetails.img2!,
                              productDetailsController.productDetails.img3!,
                              productDetailsController.productDetails.img4!,
                            ],
                          ),
                          productDetailsAppBar
                        ],
                      ),
                      productDetailsWidget(productDetailsController.productDetails, productDetailsController.availableColors, productDetailsController.availableSizes),
                    ],
                  ),
                ),
              ),
            ProuductDetailsNavbar(productDetailsController.productDetails, productDetailsController.availableColors, productDetailsController.availableSizes, quantity),

            ],
          ),
        );
      }),
    );
  }

  Padding productDetailsWidget(ProductDetails productDetails, List<String> color, List<String> sizes) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(productDetails.product?.title ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                        letterSpacing: .5,
                        fontWeight: FontWeight.w700,
                      ))),
              CustomStepper(
                  lowerLimit: 1,
                  upperLimit: 10,
                  stepValue: 1,
                  value: 1,
                  onChange: (newValue) {
                    quantity = newValue;
                  })
            ],
          ),
          Row(
            children: [
              Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),
                Text(
                  "${productDetails.product?.star ?? ""}",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.blueGrey),
                ),
              ]),
              TextButton(
                onPressed: () {
                  Get.find<ReviewListController>().getReviewList(productDetails.productId!);
                },
                child: Text(
                  "Review",
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Card(
                color: AppColors.primaryColor,
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              )
            ],
          ),
          const ProductDetailsTitleText(title: "Color"),
          const SizedBox(
            height: 16,
          ),
          ProductColorsList(
            colors:color,
            onSelected: (int selected){},
            initialSelected: 0,

          ),

          const SizedBox(
            height: 16,
          ),
          const ProductDetailsTitleText(title: "Size"),
          const SizedBox(
            height: 16,
          ),
          ProductSizeList(
              size: sizes,
              onSelected: (int selected) {},
              initialSelected: 0),
          const SizedBox(
            height: 16,
          ),
          const ProductDetailsTitleText(title: "Description"),
          const SizedBox(
            height: 8,
          ),
          Text("${productDetails.des}")
        ],
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Product Details",
        style: TextStyle(color: Colors.black),
      ),
      leading: const BackButton(
        color: Colors.black,
      ),
    );
  }




}

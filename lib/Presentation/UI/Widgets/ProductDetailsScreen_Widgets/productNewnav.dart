import 'package:ecommerce/Data/model/product_details.dart';
import 'package:ecommerce/Presentation/State_holders/addTo_cart_controller.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:ecommerce/Presentation/UI/Widgets/ProductDetailsScreen_Widgets/product_color_list.dart';
import 'package:ecommerce/Presentation/UI/Widgets/ProductDetailsScreen_Widgets/product_size_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ProductSizeList productSizeList = const ProductSizeList();

ProuductDetailsNavbar(ProductDetails details, List<String>colors, List<String>sizes, int quantity) {
  return  Container(
    decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16))),
    child: Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                details.product?.title??"",
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4,),
              Text(
                "\$${details.product?.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.primaryColor),
              )
            ],
          ),
          SizedBox(
              width: 120,
              child: GetBuilder<AddToCartController>(
                  builder: (addToCartController) {
                    if(addToCartController.addToCartInProgress){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    return ElevatedButton(
                        onPressed:() async {
                          final result = await addToCartController.addToCart(details.id!, colors[ProductColorsList.selectedColorIndex], sizes[ProductSizeList.selectedIndex],quantity );
                          if(result){
                            Get.snackbar("Added To Cart", "This has been Product added to Cart List",snackPosition: SnackPosition.BOTTOM);
                          }

                        }, child:  const Text("Add To Cart"));
                  }
              ))
        ],
      ),
    ),
  );
}





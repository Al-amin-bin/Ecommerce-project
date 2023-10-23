import 'package:ecommerce/Data/model/cart_list_model.dart';
import 'package:ecommerce/Presentation/State_holders/cart_list_controller.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:ecommerce/Presentation/UI/Widgets/ProductDetailsScreen_Widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.cartData,
  });

  final CartData cartData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(cartData.product?.image ?? ""))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartData.product?.title ?? "",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            RichText(
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black),
                                    children: [
                                  TextSpan(
                                      text: "Color: ${cartData.color ?? ""}  "),
                                  TextSpan(
                                      text: "Size: ${cartData.size ?? ""}"),
                                ])),
                          ],
                        ),
                      ),

                       IconButton(
                              onPressed: () {
                                Get.find<CartListController>().removeCartList(cartData.productId!);
                              }, icon: const Icon(Icons.delete))

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${cartData.product?.price ?? ""}",

                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 16),
                      ),
                      SizedBox(
                        width: 80,
                        child: FittedBox(
                          child: CustomStepper(
                              lowerLimit: 1,
                              upperLimit: 20,
                              stepValue: 1,
                              value: cartData.quantity?? 1,
                              onChange: (int value) {
                                Get.find<CartListController>().changeItem(cartData.id!, value);
                              }),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

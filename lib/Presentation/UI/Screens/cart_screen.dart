import 'package:ecommerce/Data/model/cart_list_model.dart';
import 'package:ecommerce/Presentation/State_holders/cart_list_controller.dart';
import 'package:ecommerce/Presentation/State_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:ecommerce/Presentation/UI/Widgets/ProductDetailsScreen_Widgets/custom_stepper.dart';
import 'package:ecommerce/Presentation/UI/Widgets/cart_screen_nav.dart';
import 'package:ecommerce/Presentation/UI/Widgets/cart_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<CartListController>().getCartList();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Cart",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
          )
      ),
      body: GetBuilder<CartListController>(
        builder: (cartListController) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: cartListController.cartListModel.data?.length??0,
                    itemBuilder: (context, index){
                      return CartProductCard(cartData: cartListController.cartListModel.data![index],);

                }),
              ),
              CartScreenNav(totalPrice: cartListController.totalPrice)
            ],
          );
        }
      ),
    );
  }
}



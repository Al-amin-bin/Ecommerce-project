import 'package:ecommerce/Presentation/State_holders/category_controller.dart';
import 'package:ecommerce/Presentation/State_holders/home_slider_controller.dart';
import 'package:ecommerce/Presentation/State_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/Presentation/State_holders/new_product_controller.dart';
import 'package:ecommerce/Presentation/State_holders/populur_product_controller.dart';
import 'package:ecommerce/Presentation/State_holders/special_product_controller.dart';
import 'package:ecommerce/Presentation/UI/Screens/cart_screen.dart';
import 'package:ecommerce/Presentation/UI/Screens/category_product_screen.dart';
import 'package:ecommerce/Presentation/UI/Screens/home_Screen.dart';
import 'package:ecommerce/Presentation/UI/Screens/wish_list_screen.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  List<Widget> _screen = [
    const HomeScreen(),
    const CategoryProductScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<HomeSliderController>().getHomeSlider();
      Get.find<CategoryController>().getCategories();
      Get.find<PopularProductController>().getPopularProduct();
      Get.find<SpecialProductController>().getSpecialProduct();
      Get.find<NewProductController>().getNewProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screen[controller.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:controller.currentSelectedIndex ,
            onTap: controller.changeScreen,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              const BottomNavigationBarItem(icon:  Icon(Icons.home),label: "Home"),
              const BottomNavigationBarItem(icon:  Icon(Icons.dashboard),label: "Category"),
              const BottomNavigationBarItem(icon:  Icon(Icons.add_shopping_cart),label: "Cart"),
              const BottomNavigationBarItem(icon:  Icon(Icons.card_giftcard_outlined),label: "Wish"),

            ],
          ),
        );
      }
    );
  }
}

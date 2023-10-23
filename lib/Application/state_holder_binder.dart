import 'package:ecommerce/Presentation/State_holders/addTo_cart_controller.dart';
import 'package:ecommerce/Presentation/State_holders/cart_list_controller.dart';
import 'package:ecommerce/Presentation/State_holders/category_controller.dart';
import 'package:ecommerce/Presentation/State_holders/completeProfileController.dart';
import 'package:ecommerce/Presentation/State_holders/create_ReviewController.dart';
import 'package:ecommerce/Presentation/State_holders/email_verification_screen_controller.dart';
import 'package:ecommerce/Presentation/State_holders/home_slider_controller.dart';
import 'package:ecommerce/Presentation/State_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/Presentation/State_holders/new_product_controller.dart';
import 'package:ecommerce/Presentation/State_holders/otp_verification_screen_controller.dart';
import 'package:ecommerce/Presentation/State_holders/populur_product_controller.dart';
import 'package:ecommerce/Presentation/State_holders/productList_controller.dart';
import 'package:ecommerce/Presentation/State_holders/product_details_controller.dart';
import 'package:ecommerce/Presentation/State_holders/readprofile_controller.dart';
import 'package:ecommerce/Presentation/State_holders/review_list_controller.dart';
import 'package:ecommerce/Presentation/State_holders/special_product_controller.dart';
import 'package:get/get.dart';

class StateHolderBinders extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(OTPVerificationController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(NewProductController());
    Get.put(SpecialProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(ProductListController());
    Get.put(CartListController());
    Get.put(CompleteProfileController());
    Get.put(ReadProfileController());
    Get.put(ReviewListController());
    Get.put(CreateReviewController());
  }

}

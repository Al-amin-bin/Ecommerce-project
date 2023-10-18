import 'package:ecommerce/Presentation/State_holders/auth_controller.dart';
import 'package:ecommerce/Presentation/UI/Screens/Auth/email_verification_screen.dart';
import 'package:ecommerce/Presentation/UI/Screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/Presentation/UI/Utility/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToNextScreen();
    super.initState();
  }

 void goToNextScreen(){
    Future.delayed(const Duration(seconds: 2)).then((value){
      AuthController.getAccessToken();
      Get.offAll(()=>AuthController.isLoggedIn()? const MainNavScreen(): const EmailVerificationScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Center(child: SvgPicture.asset(ImageAsset.craftyBaySVG,width: 100,)),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(height: 16,),
          const Text("Version 1.0.0"),
          const SizedBox(height: 16,)
        ],

      ),
    );
  }
}

import 'dart:async';
import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:ecommerce/Presentation/State_holders/email_verification_screen_controller.dart';
import 'package:ecommerce/Presentation/State_holders/otp_verification_screen_controller.dart';
import 'package:ecommerce/Presentation/State_holders/readprofile_controller.dart';
import 'package:ecommerce/Presentation/UI/Screens/Auth/complete_profile_screen.dart';
import 'package:ecommerce/Presentation/UI/Screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:ecommerce/Presentation/UI/Utility/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  OtpVerificationScreen({super.key, required this.email});
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  @override
  void initState() {
    final CounterController counterController = Get.put(CounterController());
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: SvgPicture.asset(
                    ImageAsset.craftyBaySVG,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Enter OTP Code",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 30),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "A-4 Digit Code has been Sent",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 16,
                ),
                PinCodeTextField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "please fill the code";
                    }
                    return null;
                  },
                  controller: _otpTEController,
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      disabledColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      inactiveColor: AppColors.primaryColor,
                      activeFillColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      selectedColor: Colors.green),
                  animationDuration: const Duration(milliseconds: 300),
                  onCompleted: (v) {},
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<OTPVerificationController>(
                      builder: (controller) {
                        if(controller.otpValidationProgress){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            verifyOtp(controller);
                          }
                        },
                        child: const Text("Next"));
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<CounterController>(builder: (controller) {
                  return RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          const TextSpan(
                            text: "This Code will expire in ",
                          ),
                          TextSpan(
                              style: TextStyle(color: AppColors.primaryColor),
                              text: "${controller.counter} S")
                        ]),
                  );
                }),
                GetBuilder<EmailVerificationController>(
                  builder: (emailVerificationController) {
                    if (emailVerificationController.emailVerificationProgress) {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    return TextButton(
                        onPressed: () async {
                          final response = await emailVerificationController
                              .verifyEmail(widget.email);
                          if (response) {
                            Get.off(OtpVerificationScreen(email: widget.email));
                            setState(() {
                            });
                          }
                        },
                        child: const Text(
                          "Resend Code",
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void>verifyOtp(OTPVerificationController controller) async {
    final response = await controller.verifyOtp(widget.email, _otpTEController.text.trim());
    if(response){
      Future.delayed(const Duration(seconds: 4)).then((value) => checkReadProfile());
      // checkReadProfile();
      // Get.offAll(()=> const MainNavScreen());

    }else{
      Get.snackbar("Alert", "Otp Verification Failed");
    }
  }

  Future<void> checkReadProfile() async {
    NetworkResponse response = await NetworkCaller.getRequest(Urls.readProfile);
    print("Read profile____________________");

    if(response.isSuccess){
      if(response.body!=null){
        Get.off(()=>const MainNavScreen());
      }else{
        Get.off(()=> const CompleteProfileScreen());
      }

    }
  }
}

class CounterController extends GetxController {
  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  late Timer _timer;
  int _counter = 120;
  get counter => _counter;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        _counter--;
        update();
      } else {
        _timer.cancel();
      }
    });
  }
}



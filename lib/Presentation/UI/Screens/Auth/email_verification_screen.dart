import 'package:ecommerce/Presentation/State_holders/email_verification_screen_controller.dart';
import 'package:ecommerce/Presentation/UI/Screens/Auth/otp_verification_screen.dart';
import 'package:ecommerce/Presentation/UI/Utility/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                "Welcome Back",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 30),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Please Enter Your Email Address",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (String? value){
                  if(value?.isEmpty?? true){
                    return "Please Enter Your Email";
                  }else if(value!.isEmail== false){
                    return "Enter a valid Email Address";
                  }
                  return null;
                },
                controller: _emailTEController,
                decoration: const InputDecoration(hintText: "Email Address"),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: GetBuilder<EmailVerificationController>(
                  builder: (controller) {
                    if(controller.emailVerificationProgress){
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(onPressed: () {
                      if(_formKey.currentState!.validate()){
                        verifyEmail(controller);
                      }

                    },

                        child: const Text("Next"));
                  }
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
 Future<void> verifyEmail(EmailVerificationController controller) async {
    final response = await controller.verifyEmail(_emailTEController.text.trim());
    if(response){
      Get.to(OtpVerificationScreen(email: _emailTEController.text.trim(),));
    }else{
      Get.snackbar("Alert!", "Email Verification Failed");
    }

  }

}


import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:ecommerce/Presentation/State_holders/auth_controller.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController{
  bool _otpValidationProgress = false;
  String _massage ="";

  bool get otpValidationProgress=> _otpValidationProgress;
  String get massage => _massage;

  Future<bool> verifyOtp(String email, String otp) async {
    _otpValidationProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.verifyLogin(email,otp));

    _otpValidationProgress= false;
    update();
    if(response.isSuccess){
      AuthController.setAccessToken(response.body?['data']);
      return true;
    }else{
      return false;
    }
  }
}
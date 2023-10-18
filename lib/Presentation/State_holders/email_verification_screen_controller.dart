
import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController{
  bool _emailVerificationProgress = false;
  String _massage ="";

  bool get emailVerificationProgress=> _emailVerificationProgress;
  String get massage => _massage;

  Future<bool> verifyEmail(String email) async {
    _emailVerificationProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.verifyEmail(email));

    _emailVerificationProgress= false;
    update();
    if(response.isSuccess){
      _massage = response.body?['data'] ?? '';
      return true;
    }else{
      return false;
    }
  }
}
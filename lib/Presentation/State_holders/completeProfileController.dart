import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController{
  bool _completeProfileInProgress = false;
  String _massage ="";

  bool get completeProfileInProgress=> _completeProfileInProgress;
  String get massage => _massage;

  Future<bool> completeProfile( String firstName,String lastName, String phone, String city, String soppingAddress) async {
    _completeProfileInProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.postRequest(Urls.completeProfile, {
      "id": 0,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": phone,
      "city": city,
      "shippingAddress": soppingAddress,
      "email": "alaminbinshofiqul@gmail.com",
      "created_at": "",
      "updated_at": ""
    });

    _completeProfileInProgress= false;
    update();
    if(response.isSuccess){
      return true;
    }else{
      return false;
    }
  }
}
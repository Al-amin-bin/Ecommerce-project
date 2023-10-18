import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController{

  Future<bool> readProfile() async {
    NetworkResponse response =await NetworkCaller.getRequest(Urls.readProfile);
    if(response.isSuccess){
      return true;
    }else{
      return false;
    }

  }

}
import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/model/product_model.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class SpecialProductController extends GetxController{
  ProductModel _specialProductModel = ProductModel();
  bool _specialProductInProgress = false;
  String _errorMassage = "";
  ProductModel get specialProductModel => _specialProductModel;
  bool get specialProductInProgress => _specialProductInProgress;
  String get errorMassage => _errorMassage;
  
  Future<bool>getSpecialProduct() async {
    _specialProductInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductByRemarks("special"));
    _specialProductInProgress = false;
    update();
    if(response.isSuccess){
      _specialProductModel = ProductModel.fromJson(response.body??{});
      update();
      return true;
    }else{
      _errorMassage = "special product fetch failed";
      return false;
    }
  }
  
}
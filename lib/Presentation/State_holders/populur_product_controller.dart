import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/model/product_model.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  ProductModel _popularProductModel = ProductModel();
  bool _popularProductProgress = false;
  String _errorMassage = "";

  ProductModel get popularProductModel => _popularProductModel;
  bool get popularProductProgress => _popularProductProgress;
  String get errorMassage => _errorMassage;

  Future<bool>getPopularProduct () async {
    _popularProductProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductByRemarks("popular"));
    _popularProductProgress = false;
    update();
    if(response.isSuccess){
      _popularProductModel = ProductModel.fromJson(response.body??{});
      update();
      return true;
    }else{
      _errorMassage= "Popular Product Data patch failed";
      update();
      return false;
    }
  }

}
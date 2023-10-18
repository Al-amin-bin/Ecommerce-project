import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/model/product_model.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController{
  ProductModel _newProductModel = ProductModel();
  bool _newProductProgress = false;
  String _errorMassage = "";

  ProductModel get newProductModel => _newProductModel;
  bool get newProductProgress => _newProductProgress;
  String get errorMassage => _errorMassage;

  Future<bool>getNewProduct () async {
    _newProductProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductByRemarks("new"));
    _newProductProgress = false;
    update();
    if(response.isSuccess){
      _newProductModel = ProductModel.fromJson(response.body??{});
      update();
      return true;
    }else{
      _errorMassage= "new Product Data patch failed";
      update();
      return false;
    }
  }

}
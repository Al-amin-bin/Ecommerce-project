import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController{
  bool _addToCartInProgress = false;
  String _massage ="";

  bool get addToCartInProgress=> _addToCartInProgress;
  String get massage => _massage;

  Future<bool> addToCart(int productId, String color,String size, int quantity) async {
    _addToCartInProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.postRequest(Urls.addToCart, {
      "product_id": productId,
      "qty": 5,
      "color": color,
      "size": size
    });

    _addToCartInProgress= false;
    update();
    if(response.isSuccess){
      return true;
    }else{
      return false;
    }
  }
}
import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class DeleteToCartListController extends GetxController{
  bool _deleteCartInProgress = false;
  String _massage ="";

  bool get deleteCartInProgress=> _deleteCartInProgress;
  String get massage => _massage;

  Future<bool> deleteToCartList(int productId) async {
    _deleteCartInProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.deleteToCartList(productId) );
    _deleteCartInProgress= false;
    update();
    if(response.isSuccess){
      return true;
    }else{
      return false;
    }
  }
}
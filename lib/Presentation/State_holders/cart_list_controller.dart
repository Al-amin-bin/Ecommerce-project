import 'package:ecommerce/Data/model/cart_list_model.dart';
import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController{
  bool _cartListInProgress = false;
  String _massage ="";
  double _totalPrice = 0;
  CartListModel _cartListModel = CartListModel();

  bool get cartListInProgress=> _cartListInProgress;
  String get massage => _massage;
  CartListModel get cartListModel => _cartListModel;
  double get totalPrice => _totalPrice;


  Future<bool> getCartList() async {
    _cartListInProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getCartList);
    _cartListInProgress= false;
    if(response.isSuccess){
      _cartListModel = CartListModel.fromJson(response.body!);
      _calculateTotalPrice();
      update();
      return true;
    }else{
      return false;
    }
  }
  
  void changePrice(int cardID, int noOfItem){
    _cartListModel.data?.firstWhere((cartData) => cartData.id== cardID).numberOfItems = noOfItem;
    _calculateTotalPrice();
  }

  void _calculateTotalPrice(){
    _totalPrice =0;
    for(CartData data in _cartListModel.data??[]){
      _totalPrice += (data.numberOfItems * (double.tryParse(data.product?.price ?? "")??0));
      update();
    }
  }
}
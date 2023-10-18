
import 'package:ecommerce/Data/model/category_model.dart';
import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/model/product_model.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController{
  ProductModel _productModel = ProductModel();
  bool _productListInProgress = false;
  String _massage ="";

  bool get productListInProgress=> _productListInProgress;
  ProductModel get productModel=> _productModel;
  String get massage => _massage;

  Future<bool> getProductList(int productId) async {
    _productListInProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductList(productId));

    _productListInProgress= false;
    update();
    if(response.isSuccess){
      _productModel = ProductModel.fromJson(response.body ??{});
      update();
      return true;
    }else{
      _massage = "Product list model data fetch failed";
      update();
      return false;
    }
  }
  void setProducts(ProductModel productModel){
    _productModel = productModel;
    update();
  }
}
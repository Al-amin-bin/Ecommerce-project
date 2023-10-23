import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/model/product_details.dart';
import 'package:ecommerce/Data/model/product_details_model.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  ProductDetails _productDetails = ProductDetails();
  bool _productDetailsInProgress = false;
  String _errorMassage = "";
   List<String>_availableColors = [];
   List<String>_availableSizes = [];

  ProductDetails get productDetails => _productDetails;

  bool get productDetailsInProgress => _productDetailsInProgress;

  String get errorMassage => _errorMassage;
  List<String> get availableColors => _availableColors;
  List<String> get availableSizes => _availableSizes;

  Future<bool> getProductDetails(int productId) async {
    _productDetailsInProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductDetails(productId));
    _productDetailsInProgress = false;
    update();
    if (response.isSuccess) {
      _productDetails = (ProductDetailsModel.fromJson(response.body??{})).data!.first;
      _convertStringToColor(_productDetails.color??"");
      _convertStringToSizes(_productDetails.size??"");
      update();
      return true;
    } else {
      _errorMassage = "Product Details fetch failed";
      update();
      return false;
    }
  }

  void _convertStringToColor(String color){
    // _availableColors.clear();
    // final List<String> splittedColors = color.split(",");
    // for(String c in splittedColors){
    //   if(c.isNotEmpty){
    //     _availableColors.add(c);
    //   }
    // }
    if(color.isNotEmpty){
      _availableColors = color.split(',');
    }

  }
  void _convertStringToSizes(String size){
    if(size.isNotEmpty) {
      _availableSizes = size.split(',');
    }

  }
}

import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController{
  bool _createReviewInProgress = false;
  String _massage ="";

  bool get createReviewInProgress=> _createReviewInProgress;
  String get massage => _massage;

  Future<bool> createReview( String description,int productID) async {
    _createReviewInProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.postRequest(Urls.completeProfile, {
      "id": 21,
      "description": description,
      "rating": 5,
      "customer_id": "8",
      "product_id": productID,
    });

    _createReviewInProgress= false;
    update();
    if(response.isSuccess){
      return true;
    }else{
      return false;
    }
  }
}
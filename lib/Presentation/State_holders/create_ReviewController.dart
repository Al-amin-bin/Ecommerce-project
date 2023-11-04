import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController{
  bool _createReviewInProgress = false;
  String _massage ="";

  bool get createReviewInProgress=> _createReviewInProgress;
  String get massage => _massage;

  Future<bool> createReview( String description,int productID, int id, String rating, int customerId) async {
    _createReviewInProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.postRequest(Urls.createReview, {
      "id": id,
      "description": description,
      "rating": rating,
      "customer_id": customerId,
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
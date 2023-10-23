import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/model/review_model.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:ecommerce/Presentation/UI/Screens/review_screen.dart';
import 'package:get/get.dart';

class ReviewListController extends GetxController{
  ReviewModel _reviewListModel = ReviewModel();
  bool _reviewListInProgress = false;
  String _errorMassage = "";

  ReviewModel get reviewListModel => _reviewListModel;
  bool get reviewListInProgress => _reviewListInProgress;
  String get errorMassage => _errorMassage;

  Future<bool>getReviewList (int id) async {
    _reviewListInProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.listReviewByProduct(id));
    _reviewListInProgress = false;
    update();
    if(response.isSuccess){
      _reviewListModel = ReviewModel.fromJson(response.body??{});
      update();
      Get.to(()=> ReviewScreen());
      return true;
    }else{
      _errorMassage= "Popular Product Data patch failed";
      update();
      return false;
    }
  }
}
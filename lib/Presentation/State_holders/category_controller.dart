
import 'package:ecommerce/Data/model/category_model.dart';
import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  CategoryModel _categoryModel = CategoryModel();
  bool _categoryProgress = false;
  String _massage ="";

  bool get categoryProgress=> _categoryProgress;
  CategoryModel get categoryModel=> _categoryModel;
  String get massage => _massage;

  Future<bool> getCategories() async {
    _categoryProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getCategories);

    _categoryProgress= false;
    update();
    if(response.isSuccess){
      _categoryModel = CategoryModel.fromJson(response.body ??{});
      update();
      return true;
    }else{
      _massage = "category list model data fetch failed";
      update();
      return false;
    }
  }
}
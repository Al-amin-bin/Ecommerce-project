
import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/model/slider_model.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController{
  bool _homeSliderProgress = false;
  String _massage ="";
  SliderModel _sliderModel = SliderModel();
  SliderModel get sliderModel => _sliderModel;

  bool get homeSliderProgress=> _homeSliderProgress;
  String get massage => _massage;
  

  Future<bool> getHomeSlider() async {
    _homeSliderProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.homeSlider);

    _homeSliderProgress= false;
    update();
    if(response.isSuccess){
      _sliderModel =SliderModel.fromJson( response.body ?? {});
      return true;
    }else{
      return false;
    }
  }
}
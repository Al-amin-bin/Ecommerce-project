import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/model/read_profile.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController{
  bool _readProfileInProgress = false;
  String _msg = "";
  ReadProfileModel _readProfileModel = ReadProfileModel();

  bool get readProfileInProgress => _readProfileInProgress;
  ReadProfileModel get readProfileModel => _readProfileModel;
  String get msg => _msg;

  Future<bool> readProfile() async {
    _readProfileInProgress = true;
    update();
    NetworkResponse response =await NetworkCaller.getRequest(Urls.readProfile);
    _readProfileInProgress =false;
    update();
    if(response.isSuccess){
      _readProfileModel = ReadProfileModel.fromJson(response.body!);
      return true;
    }else{
      _msg = "Read profile Not Complete!";
      return false;
    }

  }

}
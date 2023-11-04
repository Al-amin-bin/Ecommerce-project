import 'package:ecommerce/Data/model/invoice_create_response_model.dart';
import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Data/survices/network_caller.dart';
import 'package:ecommerce/Data/utilitis/urls.dart';
import 'package:get/get.dart';

class CreateInvoiceController extends GetxController{
  bool _createInvoiceInProgress = false;
  String _massage ="";
   InvoiceCreateResponseModel _invoiceCreateResponseModel = InvoiceCreateResponseModel();

  bool get createInvoiceInProgress=> _createInvoiceInProgress;
  String get massage => _massage;
  InvoiceCreateData? get invoiceCreateData => _invoiceCreateResponseModel.data?.first;

  Future<bool> createInvoice() async {
    _createInvoiceInProgress= true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.createInvoice);

    _createInvoiceInProgress= false;
    update();
    if(response.isSuccess && response.body!["msg"]=="success"){
      _invoiceCreateResponseModel = InvoiceCreateResponseModel.fromJson(response.body!);
      return true;
    }else{
      _massage = "Invoice Creation failed! try again";
      return false;
    }
  }
}
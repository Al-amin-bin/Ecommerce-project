import 'package:ecommerce/Data/model/payment_method.dart';
import 'package:ecommerce/Presentation/State_holders/create_invoice_controller.dart';
import 'package:ecommerce/Presentation/UI/Screens/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isComplete = false;

  @override
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_) {
     Get.find<CreateInvoiceController>().createInvoice().then((value) {
       isComplete = value;
       if(mounted){
         setState(() {
         });
       }
     });
   });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Out"),
      ),
      body: GetBuilder<CreateInvoiceController>(
        builder: (createInvoiceController) {
          if(createInvoiceController.createInvoiceInProgress){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(!isComplete){
            const Center(child: Text("Please Complete Your Profile"),);
          }
          return ListView.separated(
              itemCount: createInvoiceController.invoiceCreateData?.paymentMethod?.length?? 0,
              itemBuilder: (context, index){
                final PaymentMethod paymentMethod = createInvoiceController.invoiceCreateData!.paymentMethod![index];
                return ListTile(
                  leading: Image.network(paymentMethod.logo??"",width: 60,),
                  title: Text(paymentMethod.name??"" ),
                  onTap: (){
                    Get.to(()=> WebViewScreen(paymentUrl: paymentMethod.redirectGatewayURL!));
                  },
                );

          }, separatorBuilder: (BuildContext context, int index) {
                return const Divider();
          },);
        }
      ),
    );
  }
}

import 'package:ecommerce/Data/model/product_model.dart';
import 'package:ecommerce/Presentation/State_holders/productList_controller.dart';
import 'package:ecommerce/Presentation/UI/Widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  final int? productId;
  final ProductModel? productModel;
  const ProductListScreen({super.key,  this.productId, this.productModel});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(widget.productId!= null) {
        Get.find<ProductListController>().getProductList(widget.productId!);
      }else if(widget.productModel != null){
        Get.find<ProductListController>().setProducts(widget.productModel!);

      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        )
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 8),
        child: GetBuilder<ProductListController>(
          builder: (productListController) {
            if(productListController.productListInProgress){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(productListController.productModel.data?.isEmpty ?? true){
              return const Center(child:  Text("Empty Product List"),);
            }
            return GridView.builder(gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing:16,

            ),itemCount: productListController.productModel.data?.length??0, itemBuilder: (context, index){
              return  FittedBox(child:
                   ProductCard(product: productListController.productModel.data![index],)

              );
            });
          }
        ),
      ),
    );
  }

}

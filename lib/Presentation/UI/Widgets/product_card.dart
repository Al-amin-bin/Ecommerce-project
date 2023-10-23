import 'package:ecommerce/Data/model/product.dart';
import 'package:ecommerce/Presentation/UI/Screens/product_details_screen.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to( ProductDetailsScreen(productId: product.id!,));
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadowColor: AppColors.primaryColor.withOpacity(0.1),
        child: SizedBox(
          width: 130,
          child: Column(
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8)),
                    color: AppColors.primaryColor.withOpacity(0.1),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                        image: NetworkImage(product.image??"")
                    )
                ),


              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     Text(product.title ??"",maxLines: 1,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ),),
                    const SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "\$${product.price ?? 0}",style: const TextStyle(
                            fontSize: 13,
                            color: Colors.blueGrey
                        ),),
                         Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [

                            const Icon(Icons.star,color: Colors.amber,size: 15,),
                            Text("${product.star ??0}" ,style: const TextStyle(fontSize: 13,overflow: TextOverflow.ellipsis,color:Colors.blueGrey),),

                          ],

                        ),
                        Card(
                          color: AppColors.primaryColor,
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.favorite,color: Colors.white,size: 13,),
                          ),

                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
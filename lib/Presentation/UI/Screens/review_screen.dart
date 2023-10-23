import 'package:ecommerce/Presentation/State_holders/review_list_controller.dart';
import 'package:ecommerce/Presentation/UI/Screens/CreateReviewScreen.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text("Review",style: TextStyle(color: Colors.black),),
      ),
      body: GetBuilder<ReviewListController>(
        builder: (reviewListController) {
          if(reviewListController.reviewListInProgress){
            return const Center(child:  CircularProgressIndicator(),);
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: reviewListController.reviewListModel.data!.length ?? 0,
                      itemBuilder: (context, index){
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: ListTile(
                          title: Row(
                            children: [
                        Icon(Icons.person,size: 28,),
                              SizedBox(width: 6,),
                              Text("${reviewListController.reviewListModel.data![index].profile?.cusName}",style:TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                            ],
                          ),
                          subtitle: Text("${reviewListController.reviewListModel.data![index].description}"),

                        ),
                      ),
                    );


                  }),
                ),
              ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Padding(
              padding:
               EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Reviews(${reviewListController.reviewListModel.data!.length ?? 0})",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),

                  InkWell(
                    onTap: (){
                      Get.to( CreateReviewScreen(productID: reviewListController.reviewListModel.data[index].productId??0));

                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                        radius: 24,
                        child: const Icon(Icons.add,color: Colors.white,)),
                  )
                ],
              ),
            ),
          )
            ],
          );
        }
      ),

    );
  }
}

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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index){
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                    child: ListTile(
                      title: Row(
                        children: [
                    Icon(Icons.person,size: 28,),
                          SizedBox(width: 6,),
                          Text('Al-amin Islam',style:TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      subtitle: Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it"),

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
          const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Reviews(100)",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),

              InkWell(
                onTap: (){
                  Get.to(const CreateReviewScreen());

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
      ),

    );
  }
}

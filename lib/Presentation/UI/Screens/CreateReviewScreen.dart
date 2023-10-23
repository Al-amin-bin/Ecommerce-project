import 'package:ecommerce/Presentation/State_holders/create_ReviewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productID});
  final int productID;

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Review",style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameTEController,
                validator: (String? value){
                  if(value!.isEmpty){
                    return "Enter Your First Name";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "First Name"
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _lastNameTEController,
                validator: (String? value){
                  if(value!.isEmpty){
                    return "Enter Your Last Name";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Last Name"
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(

                maxLines: 7,
                controller: _reviewTEController,
                validator: (String? value){
                  if(value!.isEmpty){
                    return "Enter Reviews";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Reviews",
                  contentPadding: EdgeInsets.all(12)
                ),
              ),
              const SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                child: GetBuilder<CreateReviewController>(
                  builder: (createReviewController) {
                    return ElevatedButton(
                      onPressed: (){
                       if( _formKey.currentState!.validate()){
                         createReviewController.createReview(_reviewTEController.text.trim(), widget.productID);

                        }
                      },
                      child: const Text("Submit"),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

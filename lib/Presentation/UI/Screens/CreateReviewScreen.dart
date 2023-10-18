import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {

  TextEditingController _firstNameTEController = TextEditingController();
  TextEditingController _lastNameTEController = TextEditingController();
  TextEditingController _reviewTEController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                controller: _firstNameTEController,
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
                child: ElevatedButton(
                  onPressed: (){
                   if( _formKey.currentState!.validate()){

                    }
                  },
                  child: Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

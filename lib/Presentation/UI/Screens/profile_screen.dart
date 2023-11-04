import 'package:ecommerce/Presentation/State_holders/readprofile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ReadProfileController>().readProfile();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Profile",style: TextStyle(color: Colors.black),),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<ReadProfileController>(
          builder: (readProfileController) {
            if(readProfileController.readProfileInProgress){
              return const Center(child: CircularProgressIndicator(),);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 120,),
                const Center(child: CircleAvatar(backgroundColor: Colors.grey,maxRadius: 80,)),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex:3,child: Text("Name:",style: Theme.of(context).textTheme.titleLarge,)),
                    Expanded(flex:5,child: Text(readProfileController.readProfileModel.data!.cusName??"",style: Theme.of(context).textTheme.titleLarge,))
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(flex:3,child: Text("Phone:",style: Theme.of(context).textTheme.titleLarge,)),
                    Expanded(flex:5,child: Text(readProfileController.readProfileModel.data!.cusPhone??"",style: Theme.of(context).textTheme.titleLarge,))
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(flex:3,child: Text("City :",style: Theme.of(context).textTheme.titleLarge,)),
                    Expanded(flex:5,child: Text(readProfileController.readProfileModel.data!.cusCity??"",style:Theme.of(context).textTheme.titleLarge,))
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(flex:3,child: Text("Address :",style: Theme.of(context).textTheme.titleLarge,)),
                    Expanded(flex:5,child: Text(readProfileController.readProfileModel.data!.cusAdd??"",style: Theme.of(context).textTheme.titleLarge,))
                  ],
                ),

              ],
            );
          }
        ),
      ),
    );
  }
}

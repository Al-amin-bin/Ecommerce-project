
import 'package:ecommerce/Presentation/State_holders/completeProfileController.dart';
import 'package:ecommerce/Presentation/UI/Utility/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameETController = TextEditingController();
  final TextEditingController _lastNameETController = TextEditingController();
  final TextEditingController _mobileETController = TextEditingController();
  final TextEditingController _cityETController = TextEditingController();
  final TextEditingController _soppingAddressETController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _fromKey,
              child: Column(children: [
                Center(
                  child: SvgPicture.asset(
                    ImageAsset.craftyBaySVG,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Complete Profile",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 30),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Get Started with us with your details",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Enter your First Name";
                    }
                    return null;
                  },
                  controller: _firstNameETController,
                  decoration: const InputDecoration(hintText: "First Name"),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Enter Your Last Name";
                    }
                    return null;
                  },
                  controller: _lastNameETController,
                  decoration: const InputDecoration(hintText: "Last Name"),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  validator: (String? value){
                    if(value!.isEmpty && value.length != 11 ){
                      return "Enter valid Number";
                    }
                    return null;
                  },
                  controller: _mobileETController,
                  decoration: const InputDecoration(hintText: "Mobile"),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Enter City Name";
                    }
                    return null;
                  },
                  controller: _cityETController,
                  decoration: const InputDecoration(hintText: "City"),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _soppingAddressETController,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Enter Sopping Address";
                    }
                    return null;
                  },
                  maxLines: 6,
                  decoration: const InputDecoration(
                      hintText: "Shopping Address",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16)),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CompleteProfileController>(
                    builder: (completeProfileController) {
                      if(completeProfileController.completeProfileInProgress){
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ElevatedButton(
                          onPressed: () {
                            if(_fromKey.currentState!.validate()){
                              completeProfileController.completeProfile(
                                  _firstNameETController.text.toString().trim(),
                                  _lastNameETController.text.toString().trim(),
                                  _mobileETController.text.toString().trim(),
                                  _cityETController.text.toString(),
                                  _soppingAddressETController.text.toString()
                              );
                            }
                            _firstNameETController.clear();
                            _lastNameETController.clear();
                            _mobileETController.clear();
                            _cityETController.clear();
                            _soppingAddressETController.clear();
                          },
                          child: const Text("Complete"));
                    }
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

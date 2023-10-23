import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/Application/state_holder_binder.dart';
import 'package:ecommerce/Presentation/UI/Screens/splashScreen.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CraftyBay extends StatefulWidget {
static  GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
   const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}


class _CraftyBayState extends State<CraftyBay> {
  @override
  void initState() {
    checkInternetConnectivityStatus();
    super.initState();
  }
  late final StreamSubscription _connectivityStreamStatus;
  Future<void> checkInitialInternetConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    handleConnectivityState(result);
  }

 void checkInternetConnectivityStatus(){
    _connectivityStreamStatus = Connectivity().onConnectivityChanged.listen((status) {
     handleConnectivityState(status);
    });

  }
  void handleConnectivityState(ConnectivityResult status){
    if(status != ConnectivityResult.mobile && status != ConnectivityResult.wifi){
      Get.showSnackbar(const GetSnackBar(
        title: "No Internet",
        message: "Please Check your Connectivity",
        isDismissible: false,
      ));
    }else{
      if(Get.isSnackbarOpen){
        Get.closeAllSnackbars();
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.globalKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
          primarySwatch:
              MaterialColor(AppColors.primaryColor.value, AppColors().color),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        appBarTheme: AppBarTheme(
          backgroundColor:  Colors.white,
          iconTheme:  IconThemeData(color: Colors.black87)
        ),
      ),
      darkTheme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            fillColor: Colors.black87,
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey,
        ),

      ),
      initialBinding: StateHolderBinders(),
    );
  }
}



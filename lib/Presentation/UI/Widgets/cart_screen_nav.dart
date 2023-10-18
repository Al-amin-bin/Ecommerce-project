import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:flutter/material.dart';

class CartScreenNav extends StatelessWidget {
  const CartScreenNav({
    super.key, required this.totalPrice,});
  final double totalPrice;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16))),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "Total Price",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4,),
                Text(
                  "\$$totalPrice",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors.primaryColor),
                )
              ],
            ),
            SizedBox(
                width: 120,
                child: ElevatedButton(
                    onPressed:(){}, child:  Text("Check Out")))
          ],
        ),
      ),
    );
  }
}
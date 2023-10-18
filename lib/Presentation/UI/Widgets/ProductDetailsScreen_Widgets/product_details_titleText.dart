import 'package:flutter/material.dart';

class ProductDetailsTitleText extends StatelessWidget {
  const ProductDetailsTitleText({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 18),
    );
  }
}
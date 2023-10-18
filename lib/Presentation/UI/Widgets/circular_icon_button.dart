import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton(this.onTap, this.icon, {
    super.key,
  });


  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 16,
          child:  Icon(
            icon,
            color: Colors.grey,
            size: 18,
          )),
    );
  }
}
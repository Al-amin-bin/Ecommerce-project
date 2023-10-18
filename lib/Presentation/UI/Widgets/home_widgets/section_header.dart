import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.onTap, required this.title,
  });
  final String  title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
        const Spacer(),
        TextButton(onPressed: onTap, child: const Text("See All"),),
      ],
    );
  }
}
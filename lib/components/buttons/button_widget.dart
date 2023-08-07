
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
  });
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(icon,size: 25,color: whiteCl,),
          onPressed: () {},
        ),
        Text(label, style: const TextStyle(fontSize: 10, color: greyCl))
      ],
    );
  }
}
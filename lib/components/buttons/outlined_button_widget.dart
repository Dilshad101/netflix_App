
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomOutLinedButton extends StatelessWidget {
  const CustomOutLinedButton({
    super.key,
    required this.label
  });
 final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      padding:
          const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: whiteCl, width: 1),
      ),
      child:  Text(label),
    );
  }
}

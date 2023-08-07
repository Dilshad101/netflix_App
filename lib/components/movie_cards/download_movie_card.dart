import 'package:flutter/material.dart';

class DownloadCard extends StatelessWidget {
  const DownloadCard(
      {super.key,
      required this.angle,
      this.margin,
      required this.imagepath,
      required this.height,
      required this.width});

  final double angle;
  final EdgeInsets? margin;

  final double height;
  final double width;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
                image: NetworkImage(imagepath),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover)),
      ),
    );
  }
}

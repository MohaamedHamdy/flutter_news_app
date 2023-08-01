// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  String url;
  double? height;
  double? width;
  double? radius;
  Widget? child;
  EdgeInsets? padding;
  EdgeInsets? margin;

  ImageContainer({
    Key? key,
    required this.url,
    this.height = 190,
    this.width = 120,
    this.radius,
    this.child,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          image: NetworkImage(
            url,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

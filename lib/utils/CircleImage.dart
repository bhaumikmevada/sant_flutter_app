import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ColorUtils.dart';


class Circleimage extends StatelessWidget {

  bool isAssetsImage;
  bool isNetworkImage;
  bool isSvgImage;
  double width;
  double height;
  String image;
  EdgeInsetsGeometry margin = EdgeInsets.only(right: 10);
  double radius;
  bool isBorderVisible;
  Color borderColor;
  double borderWidth;

  Circleimage({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    this.isAssetsImage = false,
    this.isNetworkImage = false,
    this.isSvgImage = false,
    required this.margin,
    this.radius = 50.0,
    this.isBorderVisible = false,
    this.borderWidth = 1,
    this.borderColor = colorBlack
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: Border.all(
              color: borderColor,width: isBorderVisible ? borderWidth : 0
          )
      ),
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: isNetworkImage ? Image.network(
          image,
          width: width,
          height: height,
          fit: BoxFit.fill,
          errorBuilder: (context,error,stackTrace){
            return Container(
              width: width,
              height: height,
            );
          },
        ) : isAssetsImage ? Image.asset(
          image,
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorBuilder: (context,error,stackTrace){
            return Container(
              width: width,
              height: height,
            );
          },
        ) : SvgPicture.asset(
          image,
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorBuilder: (context,error,stackTrace){
            return Container(
              width: width,
              height: height,
            );
          },
        ),
      ),
    );
  }
}

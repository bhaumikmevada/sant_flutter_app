import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ColorUtils.dart';
import 'ImageUtils.dart';

class CircleImage extends StatelessWidget {

  double width = 70;
  double height = 70;
  bool isNetworkImage = false;
  bool isFileImage = false;
  String image = appLogo;
  double radius = 50;
  Color borderColor = colorPrimary;
  double borderWidth = 1;
  Color backgroundColor = colorWhite;
  File? file;

  CircleImage({
    Key? key,
    this.width = 100,
    this.height = 100,
    this.isNetworkImage = false,
    this.image = appLogo,
    this.radius = 50,
    required this.borderColor,
    this.borderWidth = 1,
    required this.backgroundColor,
     this.file

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // decoration: BoxDecoration(
      //     image: isNetworkImage ? DecorationImage(
      //       image: NetworkImage(image),
      //       fit: BoxFit.cover,
      //     ) : file != null ? DecorationImage(
      //     image: FileImage(file!) ,
      //     fit: BoxFit.cover,
      //   ) :
      //     DecorationImage(
      //       image: AssetImage(profileHolder),
      //       fit: BoxFit.cover,
      //     ),
      //   borderRadius:  BorderRadius.all( Radius.circular(radius)),
      //   // border: Border.all(
      //   //   color: borderColor,
      //   //   width: borderWidth,
      //   // ),
      // ),

      /*decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: Center(
          child: isNetworkImage ? Image.network(image) : file != null ? Image.file(file!) : SvgPicture.asset(image,width: 70,height: 70,),
        )
      ),
      padding: EdgeInsets.only(bottom: 10),*/
    );

  }
}

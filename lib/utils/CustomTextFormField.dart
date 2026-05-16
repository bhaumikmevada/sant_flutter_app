import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../providers/ThemeProvider.dart';
import 'ColorUtils.dart';
import 'CustomText.dart';
import 'PreferenceUtils.dart';

class CustomTextFormField extends StatefulWidget {

  TextEditingController controller;
  double radius;
  String hintText;
  EdgeInsets contentPadding;
  Color fillColor;
  TextInputType textInputType;
  TextInputAction textInputAction;
  TextAlign textAlign;
  double fontSize;
  Function(String)? onChange;
  VoidCallback? onTap;
  Function(String)? onFieldSubmit;
  bool isPrefixIcon;
  bool isSuffixIcon;
  final prefixIcon;
  final suffixIcon;
  bool obscureText;
  bool isReadOnly;
  double suffixWidth;
  double suffixHeight;
  int? minLines;
  int? maxLines;
  bool isMobileNo;
  Color borderColor;
  bool isBorderVisible;
  FocusNode? focusNode;

  CustomTextFormField({
    super.key,
    required this.controller,
    this.radius = 100,
    required this.hintText,
    this.contentPadding = const EdgeInsets.all(17),
    this.fillColor = colorWhite,
    required this.textInputType,
    required this.textInputAction,
    this.fontSize = 14.0,
    required this.onChange,
    required this.onTap,
    this.isPrefixIcon = true,
    this.isSuffixIcon = true,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.isReadOnly = false,
    this.suffixWidth = 24,
    this.suffixHeight = 24,
    this.minLines = 1,
    this.maxLines = 1,
    this.isMobileNo = false,
    this.onFieldSubmit,
    this.borderColor = colorDADADA,
    this.isBorderVisible = true,
    this.focusNode,
    this.textAlign = TextAlign.start

  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }


  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        readOnly: widget.isReadOnly,
        decoration: InputDecoration(
            filled: true,
            fillColor: isDarkMode ? colorBlack : widget.fillColor,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: widget.isBorderVisible ? BorderSide(
                color: isDarkMode ? colorWhite : widget.borderColor,
                width: 1.0,
              ) : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: widget.isBorderVisible ? BorderSide(color: isDarkMode ? colorWhite : colorDADADA, width: 1.0) : BorderSide.none,
            ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: isDarkMode ? colorWhite : colorHintText,fontFamily: CustomText.fontPoppins,fontSize: 14.0,fontWeight: FontWeight.w400,),
          contentPadding: widget.contentPadding,
          counterText: '',
          prefixIcon: widget.isPrefixIcon ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              width: 28,
              height: 28,
              child: widget.prefixIcon,
            ),
          ) : null,
          suffixIcon: widget.isSuffixIcon ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SizedBox(
              width: widget.suffixWidth,
              height: widget.suffixHeight,
              child: widget.obscureText ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                child: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: isDarkMode ? colorWhite : Colors.grey,
                ),
              ): widget.suffixIcon,
            ),
          ) : null
        ),
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        obscureText: _isObscured,
        textAlign: widget.textAlign,
        maxLength: widget.isMobileNo ? 10 : null,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: isDarkMode ? colorWhite : Colors.black,
          fontFamily: CustomText.fontPoppins,
          fontWeight: FontWeight.w400
        ),
        onChanged: widget.onChange,
        onTap: widget.onTap,
        onFieldSubmitted: widget.onFieldSubmit,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
      ),
    );
  }
}

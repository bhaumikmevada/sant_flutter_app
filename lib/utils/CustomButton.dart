import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ThemeProvider.dart';
import 'ColorUtils.dart';
import 'CustomText.dart';

class CustomButton extends StatelessWidget {


  VoidCallback callback;
  String text;
  Color? backgroundColor;
  double radius;
  double fontSize;
  bool isIconShow;
  Widget? iconWidget;
  MainAxisAlignment mainAxisAlignment;

  CustomButton({super.key,
    required this.text,
    required this.callback,
    this.backgroundColor = colorPrimary,
    this.radius = 20,
    this.fontSize = 14.0,
    this.isIconShow = false,
    this.iconWidget,
    this.mainAxisAlignment = MainAxisAlignment.center
  });

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    // return ElevatedButton(
    //   onPressed: callback,
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: isDarkMode ? colorBlack : backgroundColor,
    //     shape: RoundedRectangleBorder(
    //       side: BorderSide(color: isDarkMode ? colorWhite : colorDADADA,width: 1),
    //       borderRadius: BorderRadius.circular(radius),
    //     ),
    //
    //   ),
    //   child: Row(
    //     mainAxisAlignment: mainAxisAlignment,
    //     children: [
    //
    //       if(isIconShow && iconWidget != null)
    //         Container(
    //           margin: const EdgeInsets.only(right: 10),
    //           child: iconWidget,
    //         ),
    //
    //       CustomText.TextMedium(text,fontSize: fontSize, color: isDarkMode ? colorWhite : colorWhite,maxLine: 3)
    //
    //     ],
    //   ),
    // );

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [?backgroundColor, const Color(0xFFFB923C)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: colorPrimary.withOpacity(0.38),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)),
          ),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 0.3),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/ThemeProvider.dart';
import 'ColorUtils.dart' as AppColor;
import 'CustomText.dart';
import 'ImageUtils.dart';
import 'StringUtils.dart';

class DrawerAppBar{

  static PreferredSizeWidget MyAppBar(String title,GlobalKey<ScaffoldState> scaffoldKey, BuildContext context, {double fontSize = 18,
    bool isBackArrow = false,
    double elevation = 0,bool isCenterLogo = false}){
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return AppBar(
      backgroundColor: isDarkMode ? AppColor.colorBlack : AppColor.colorWhite,
      elevation: elevation,
      bottomOpacity: 1.0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      title: isCenterLogo ? SvgPicture.asset(appLogo,width: 40,height: 40,) :
      CustomText.TextRegular(title,fontSize: fontSize,color: isDarkMode ? AppColor.colorWhite : AppColor.colorPrimary),
      leading: isBackArrow == true
          ? IconButton(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(Icons.arrow_back),
        // icon: Image.asset(isDarkMode ? backArrowDark : backArrow,),
        onPressed: (){

          context.pop();

        },
      )
          : IconButton(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(Icons.menu,color: isDarkMode ? AppColor.colorWhite : AppColor.colorPrimary,),
        onPressed: (){

          if (scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.openEndDrawer();
          }else{
            scaffoldKey.currentState!.openDrawer();
          }

          print("scaffold state : ${scaffoldKey.currentState?.isDrawerOpen}");

        },
      ),
      actions: [

      ],

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(color: isDarkMode ? AppColor.colorBlack : AppColor.colorWhite,height: 1.0,),
      ),
    );
  }

  static PreferredSizeWidget webNavigationMenu(BuildContext context){

    return AppBar(
      backgroundColor: AppColor.colorWhite,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: CustomText.TextRegular(home,fontSize: 18),
      bottomOpacity: 0,
      actions: [

        const SizedBox(width: 20,),

        // InkWell(
        //   splashColor: Colors.transparent,
        //   onTap: (){
        //
        //   },
        //   child: Container(
        //     width: 32,
        //     margin: const EdgeInsets.only(right: 20),
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(50),
        //       child: Image.asset(profileHolder),
        //     ),
        //   ),
        // )

      ],

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(color: Colors.black26,height: 1.0,),
      ),
    );
  }


}
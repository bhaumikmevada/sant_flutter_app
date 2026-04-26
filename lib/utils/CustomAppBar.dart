import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/ThemeProvider.dart';
import 'ColorUtils.dart';
import 'CustomText.dart';
import 'ImageUtils.dart';
import 'PreferenceUtils.dart';
import 'StringUtils.dart';
import 'Utilities.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize{

  String title;
  AppBar appBar;
  bool isBackIcon;
  bool isRightLogo;
  bool isCenterLogo;
  bool isSoundIcon;
  VoidCallback? onBackPress;
  bool isBackListener = false;
  VoidCallback? soundListener;
  bool isSoundOn = false;

  CustomAppBar({
    super.key,
    required this.appBar,
    required this.title,
    this.isBackIcon = true,
    this.isRightLogo = false,
    this.isCenterLogo = false,
    this.onBackPress,
    this.isBackListener = false,
    this.isSoundIcon = false,
    this.soundListener,
    this.isSoundOn = false
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return AppBar(
      backgroundColor: isDarkMode ? colorBlack : colorWhite,
      elevation: isDarkMode ? 0.0 : 5.0,
      bottomOpacity: 2.0,
      automaticallyImplyLeading: false,
      surfaceTintColor: colorWhite,
      titleSpacing: 0.0,
      title: _buildTitle(context, title,isDarkMode),

    );
  }

  Widget _buildTitle(BuildContext context, String title, bool isDarkMode) {

    return Row(
      children: [
        isBackIcon ? _buildBackIcon(context,isDarkMode) : Container(margin: EdgeInsets.only(left: 20,),),
        Expanded(
          child: CustomText.TextSemiBold(
            title,
            fontSize: 16.0,
            color: isDarkMode ? colorWhite : colorBlack,
          ),
        )
      ],
    );
  }

  Widget _buildBackIcon(BuildContext context, bool isDarkMode){

    return Container(
      margin: EdgeInsets.only(top: 5),
      child: IconButton(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {

          if(isBackListener){
            onBackPress?.call();
          }else{
            context.pop();
          }
        },
        // icon: Transform.rotate(
        //   angle:  0,
        //   child: Image.asset(
        //     isDarkMode ? backArrowDark : backArrow,
        //     width: 40,
        //     height: 40,
        //   ),
        // ),
        icon: Icon(Icons.arrow_back_ios_new_rounded,size: 20,),
      ),
    );

  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

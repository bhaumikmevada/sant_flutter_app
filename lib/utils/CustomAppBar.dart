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
  bool isMenuIcon;
  VoidCallback? onBackPress;
  bool isBackListener = false;
  bool isNotificationIcon;
  bool isAddIcon;
  final GlobalKey<ScaffoldState> scaffoldKey;
  VoidCallback? onAddPress;
  CustomAppBar({
    super.key,
    required this.appBar,
    required this.title,
    this.isMenuIcon = true,
    this.isBackIcon = false,
    this.onBackPress,
    this.isBackListener = false,
    this.isNotificationIcon = true,
    this.isAddIcon = false,
    this.onAddPress,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return AppBar(
      backgroundColor: isDarkMode ? colorBlack : colorPrimary,
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
        isMenuIcon ? _buildMenuIcon(context,isDarkMode) :
        isBackIcon ? _buildBackIcon(context,isDarkMode) : Container(margin: EdgeInsets.only(left: 20,),),
        Expanded(
          child: CustomText.TextSemiBold(
            title,
            fontSize: 18.0,
            color: colorWhite,
          ),
        ),
        isNotificationIcon ?
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: 38, height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAF8),
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Icon(Icons.notifications_outlined,
                  color: Colors.grey.shade600, size: 20),
            ),
            Positioned(
              top: 8, right: 0,
              child: Container(
                width: 16, height: 16,
                decoration: BoxDecoration(
                  color: colorPrimary,
                  shape: BoxShape.circle,
                  border: Border.all(color: colorWhite, width: 2),
                ),
                child: const Center(
                  child: Text('5',
                      style: TextStyle(color: Colors.white,
                          fontSize: 8, fontWeight: FontWeight.w800)),
                ),
              ),
            ),
          ],
        ) : Container(),
        isAddIcon ? GestureDetector(
          onTap: (){
            onAddPress?.call();
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            width: 38, height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAF8),
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Icon(Icons.add,
                color: colorPrimary, size: 20),
          ),
        ) : Container(),
        const SizedBox(width: 10,),
      ],
    );
  }

  Widget _buildMenuIcon(BuildContext context, bool isDarkMode){

    return GestureDetector(
      onTap: () => scaffoldKey.currentState?.openDrawer(),
      child: Container(
        padding: EdgeInsets.all(4),
        margin: const EdgeInsets.only(left: 14, top: 10, bottom: 10,right: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF4ED),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: colorPrimary.withOpacity(0.18), width: 1),
        ),
        child: Icon(Icons.menu_rounded, color: colorPrimary,size: 30, ),
      ),
    );

  }

  Widget _buildBackIcon(BuildContext context, bool isDarkMode){

    return Container(
      margin: EdgeInsets.only(top: 5,right: 10),
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
        icon: Icon(Icons.arrow_back_ios_new_rounded,size: 20,color: colorWhite,),
      ),
    );

  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

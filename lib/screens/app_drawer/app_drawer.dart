import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/routes/AppRoutes.dart';
import 'package:sant_flutter_appp/utils/CircleImage.dart';
import 'package:sant_flutter_appp/utils/ColorUtils.dart';
import 'package:sant_flutter_appp/utils/PreferenceUtils.dart';
import 'package:sant_flutter_appp/utils/StringUtils.dart';

import '../../utils/ConstantUtils.dart';
import '../../utils/CustomButton.dart';
import '../../utils/CustomText.dart';
import '../../utils/Utilities.dart';

class AppDrawer extends StatelessWidget {

  final String selectedItem;
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppDrawer({
    super.key,
    required this.selectedItem,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight:    Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // GestureDetector(
            //   onTap: () {
            //     if (scaffoldKey.currentState!.isDrawerOpen) {
            //       scaffoldKey.currentState!.openEndDrawer();
            //     }
            //   },
            //   child: Container(
            //     alignment: Alignment.centerRight,
            //     child: Container(
            //       width: 30,
            //       height: 30,
            //       decoration: BoxDecoration(
            //         border: Border.all(color: colorBlack, width: 1),
            //         borderRadius: BorderRadius.circular(50),
            //       ),
            //       padding: const EdgeInsets.all(8),
            //       child: Image.asset(backMenuIcon, color: colorBlack),
            //     ),
            //   ),
            // ),

            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colorPrimary,const Color(0xFFFB923C)]
                )
              ),
              padding: const EdgeInsets.only(bottom: 16,left: 16,right: 16,top: 45),
              child: Stack(
                children: [

                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        closeDrawer();
                        context.push(profileScreenRoute);
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),

                  /// 👤 Center Profile
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // Circleimage(
                      //   width: 70,
                      //   height: 70,
                      //   image: "",
                      //   isAssetsImage: false,
                      //   isNetworkImage: true,
                      //   isBorderVisible: true,
                      //   borderColor: colorWhite,
                      //   borderWidth: 2,
                      //   margin: EdgeInsets.zero,
                      // ),

                      Stack(children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: colorBackgroundLight,
                          child: CustomText.TextRegular("TS",color: colorBlack),
                        ),
                        Positioned(bottom: 0, right: 0,
                            child: Container(width: 12, height: 12,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:Color(0xFF22C55E),
                                    border: Border.all(color: colorWhite, width: 2)))),
                      ]),

                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText.TextMedium(
                            "Jack Sparrow",
                            color: colorWhite,
                          ),

                          CustomText.TextRegular(
                            "jack@gmail.com",
                            fontSize: 11.0,
                            color: colorWhite,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Drawer Items
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _buildDrawerItem(context, dashboard, 'Dashboard & overview',
                      Icons.home_rounded,Color(0xFFF97316),Color(0xFFFFF4ED),dashboard),

                    _buildDrawerItem(context, event, 'Upcoming & past events',
                        Icons.celebration_rounded,Color(0xFF6366F1),Color(0xFFEEF2FF),event),

                    _buildDrawerItem(context, bookMark, 'Saved places & sants',
                        Icons.bookmark_rounded,Color(0xFFF59E0B),Color(0xFFFFF7ED),bookMark),

                    _buildDrawerItem(context, temple, 'Browse all temples',
                        Icons.temple_hindu_rounded,Color(0xFF10B981),Color(0xFFECFDF5),temple),

                    _buildDrawerItem(context, location, 'Sant current locations',
                        Icons.location_on_rounded,Color(0xFFF43F5E),Color(0xFFFFF1F2),location),

                    _buildDrawerItem(context, maps, 'Live tracking & routes',
                        Icons.map_rounded,Color(0xFF3B82F6),Color(0xFFEFF6FF),maps),

                    _buildDrawerItem(context, notification, 'Alerts & updates',
                        Icons.notifications_rounded,Color(0xFFF97316),Color(0xFFFFF4ED),notification),

                    _buildDrawerItem(context, settings, 'App preferences',
                        Icons.settings_rounded,Color(0xFF64748B),Color(0xFFF8FAFC),settings),

                    _buildDrawerItem(context, aboutUs, 'Learn about SantApp',
                        Icons.info_outline_rounded,Color(0xFF3B82F6),Color(0xFFEFF6FF),aboutUs),

                    _buildDrawerItem(context, helpSupport, 'FAQs & contact us',
                        Icons.help_outline_rounded,Color(0xFF22C55E),Color(0xFFF0FDF4),maps),

                    const SizedBox(height: 20),

                    // Logout Button
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 53,
                    //   child: CustomButton(
                    //     text: logout,
                    //     isIconShow: true,
                    //     iconWidget: Icon(Icons.logout_rounded,color: Color(0xFFFFE4E6),),
                    //     callback: () {
                    //      Utilities.showConfirmAlertDialog(context, logout, (){
                    //        PreferenceUtils.clearAllPref();
                    //        context.go(loginScreenRoute);
                    //      });
                    //     },
                    //   ),
                    // ),

                    GestureDetector(
                      onTap: (){
                        // Utilities.showConfirmAlertDialog(context, logout, (){
                        //   PreferenceUtils.clearAllPref();
                        //   context.go(loginScreenRoute);
                        // });
                        _showLogoutDialog(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(12, 0, 12, 6),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF1F2),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: const Color(0xFFFDA4AF).withOpacity(0.5), width: 1),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 42, height: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE4E6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.logout_rounded,
                                  color: Color(0xFFF43F5E), size: 20),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Logout',
                                      style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w700,
                                        color: Color(0xFFF43F5E), letterSpacing: -0.2,
                                      )),
                                  const SizedBox(height: 1),
                                  Text('Sign out of your account',
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.grey.shade400)),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded,
                                size: 12, color: Color(0xFFF43F5E)),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)),
        backgroundColor: colorWhite,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60, height: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF1F2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.logout_rounded,
                    color: Color(0xFFF43F5E), size: 28),
              ),
              const SizedBox(height: 16),
              CustomText.TextSemiBold('Logout?',fontSize: 16.0,color: colorBlack),
              const SizedBox(height: 8),
              CustomText.TextRegular(logoutMsg,fontSize: 12.0,color: color8D8D94,maxLine: 2),
              const SizedBox(height: 22),
              Row(
                children: [
                  // Cancel
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: CustomText.TextMedium("Cancel",color: color8D8D94),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Logout
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        PreferenceUtils.clearAllPref();
                        context.go(loginScreenRoute);
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF43F5E),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFF43F5E).withOpacity(0.30),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: CustomText.TextMedium(logout,color: colorWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildDrawerItem(
      BuildContext context,
      String title,
      String subTitle,
      IconData icons,
      Color iconColor,
      Color iconBg,
      String selectionKey, {
        bool visible = true,
        VoidCallback? onTap,
      }) {
    if (!visible) return const SizedBox.shrink();

    final bool isSelected = selectedItem == selectionKey;

    return GestureDetector(
      onTap: onTap ?? () {
        // Default navigation for normal screens
        closeDrawer();

        switch (title) {
          case dashboard:
            context.go(homeScreenRoute);
            break;
          // case menuDisplay:
          //   context.push(displayListScreenRoute);
          //   break;
          // case menuPlaylist:
          //   context.push(playlistScreenRoute);
          //   break;
          // case menuMedia:
          //   context.push(mediaListScreenRoute);
          //   break;
          // case menuCustomLayout:
          //   context.push(customLayoutListScreenRoute);
          //   break;
          // case location:
          //   context.push(locationScreenRoute);
          //   break;
          // case menuNotificationSettings:
          //   context.push(notificationSettingsListScreenRoute);
          //   break;
          // case menuAddTags:
          //   context.push(tagsScreenRoute);
          //   break;
          // case menuProduct:
          //   context.push(productListScreenRoute);
          //   break;
          // case menuBrand:
          //   context.push(brandListScreenRoute);
          //   break;
          // case menuApps:
          //   context.push(appListScreenRoute);
          //   break;
          // case menuUsers:
          //   context.push(userListScreenRoute);
          //   break;
          // case menuAccounts:
          //   sl<DataModel>().isLoginToSwitchAccount = false;
          //   context.push(accountListScreenRoute);
          //   break;
          // case menuIOTAnalytics:
          //   context.push(iotAnalyticsReportScreenRoute);
          //   break;
        // Add more cases if needed
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: isSelected ? colorPrimary.withOpacity(0.08) : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected
                  ? colorPrimary.withOpacity(0.18)
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Icon box
              Container(
                width: 42, height: 42,
                decoration: BoxDecoration(
                  color: isSelected
                      ? colorPrimary.withOpacity(0.12)
                      : iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icons,
                  color: isSelected ? colorPrimary : iconColor,
                  size: 20,
                ),
              ),

              const SizedBox(width: 12),

              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isSelected ? colorPrimary : colorBlack,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),

              // Badge or arrow
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: isSelected
                    ? colorPrimary
                    : Colors.grey.shade300,
              ),

            ],
          ),
        ),
      ),
    );
  }

  void closeDrawer() {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

}

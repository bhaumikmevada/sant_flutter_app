import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/utils/ColorUtils.dart';
import 'package:sant_flutter_appp/utils/StringUtils.dart';

import '../../routes/AppRoutes.dart';
import '../../utils/CustomAppBar.dart';
import '../../utils/CustomText.dart';
import '../../utils/PreferenceUtils.dart';
import '../app_drawer/app_drawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _selectedDrawerItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackgroundLight,
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey,appBar: AppBar(), title: myProfile,isBackIcon: true,isMenuIcon: false,),
      drawer: AppDrawer(
        selectedItem: _selectedDrawerItem ?? dashboard,
        scaffoldKey: _scaffoldKey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: colorPrimary,
              margin: EdgeInsets.only(top: 25,),
              padding: EdgeInsets.only(top: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(width: 10,),

                  Stack(children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: colorBackgroundLight,
                      child: CustomText.TextRegular("TS",color: colorBlack,fontSize: 22.0),
                    ),
                    Positioned(bottom: 0, right: 10,
                        child: Container(width: 20, height: 20,
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
                      CustomText.TextSemiBold("Jack Sparrow", color: colorWhite,fontSize: 16.0),
                      CustomText.TextMedium("jack@gmail.com", fontSize: 13.0, color: colorWhite,),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [

                  _buildCard(
                    Icons.person_outline,
                    "Edit profile",
                  ),

                  _buildCard(
                    Icons.lock_outline,
                    "Change password",
                  ),

                  _buildCard(
                    Icons.location_on_outlined,
                    "My location",
                    trailing: "Vrindavan, UP",
                  ),

                  _buildCard(
                    Icons.temple_hindu_outlined,
                    "Assigned temple",
                    trailing: "ISKCON",
                  ),

                  _buildCard(
                      Icons.calendar_month_outlined,
                      "Joined",trailing: "10 May 2026"
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20,),

            GestureDetector(
              onTap: (){
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

            const SizedBox(height: 30,),

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

  Widget _buildCard(
      IconData icon,
      String title, {
        String? trailing,
      }) {

    return Container(
      margin: EdgeInsets.only(right: 5,top: 5),
      padding: EdgeInsets.only(top: 3,bottom: 2,left: 10,right: 10),
      child: Column(
        children: [

          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.orange.shade50,
                child: Icon(icon, color: colorPrimary),
              ),

              const SizedBox(width: 10,),
              Expanded(
                child: CustomText.TextMedium(title,fontSize: 13.0),
              ),

              trailing != null
                  ? CustomText.TextRegular(trailing,fontSize: 11.0)
                  : const Icon(Icons.chevron_right,color: color8D8D94,),

            ],
          ),

          Divider(color: colorBackgroundLight,)

        ],
      ),
    );

  }
}

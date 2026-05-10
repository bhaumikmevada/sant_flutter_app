import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sant_flutter_appp/screens/app_drawer/app_drawer.dart';
import 'package:sant_flutter_appp/utils/ColorUtils.dart';
import 'package:sant_flutter_appp/utils/CustomAppBar.dart';
import 'package:sant_flutter_appp/utils/StringUtils.dart';

import '../../utils/CustomText.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _selectedDrawerItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackgroundLight,
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey,appBar: AppBar(), title: appName,),
      drawer: AppDrawer(
        selectedItem: _selectedDrawerItem ?? dashboard,
        scaffoldKey: _scaffoldKey,
      ),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 10,),
            _buildStatsGrid(),
            const SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: CustomText.TextSemiBold("Quick Actions",fontSize: 15.0,color: colorBlack),
            ),
            const SizedBox(height: 10),
            _buildQuickActions(),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 16),
                    child: CustomText.TextSemiBold("Active Sants",fontSize: 15.0,color: colorBlack),
                  ),
                ),

                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    child: CustomText.TextMedium("View All",fontSize: 14.0,color: colorPrimary),
                  ),
                )

              ],
            ),
            const SizedBox(height: 10),
            _activeSants(),
            const SizedBox(height: 30),


          ],
        ),
      ),
    );
  }

  Widget _activeSants(){
    final sants = [
      {'n': 'Tony Stark',     'l': 'Gujarat', 'on': true,  'c': colorPrimary},
      {'n': 'Kabir Panth', 'l': 'Varanasi', 'on': true,  'c': const Color(0xFF10B981)},
      {'n': 'Meera Devi',  'l': 'Mathura','on': false, 'c': const Color(0xFF6366F1)},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: sants.map((s) {
          final isOn  = s['on'] as bool;
          final color = s['c']  as Color;
          String char = s['n'].toString().split(' ').where((word) => word.isNotEmpty)
              .map((word) => word[0])
              .take(2)
              .join();

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade100, width: 1),
              boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Row(
              children: [
                Stack(children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: color.withOpacity(0.12),
                    child: CustomText.TextRegular(char,color: colorBlack),
                  ),
                  Positioned(bottom: 0, right: 0,
                      child: Container(width: 12, height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isOn ? const Color(0xFF22C55E) : Colors.grey.shade400,
                              border: Border.all(color: colorWhite, width: 2)))),
                ]),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.TextMedium(s['n'] as String,color: colorBlack),
                      const SizedBox(height: 3),
                      Row(children: [
                        Icon(Icons.location_on_rounded,
                            size: 12, color: Colors.grey.shade400),
                        const SizedBox(width: 3),
                        CustomText.TextMedium(s['l'] as String,color: colorD9D9D9,fontSize: 12.0),
                      ]),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: isOn
                        ? const Color(0xFFECFDF5)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CustomText.TextMedium(
                    isOn ? '● Online' : '○ Offline',
                    fontSize: 11.0,color:  isOn
                      ? const Color(0xFF10B981)
                      : Colors.grey.shade400
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.person_add_rounded,   'lbl': 'Add Sant', },
      {'icon': Icons.temple_hindu_rounded, 'lbl': 'Add Temple', },
      {'icon': Icons.event_rounded,        'lbl': 'Add Event',},
      {'icon': Icons.map_rounded,          'lbl': 'Live Map',},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.3,
        children: actions.map((s) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade100, width: 1),
              boxShadow: [BoxShadow(
                  color: colorE6E6E6,
                  blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: BoxBorder.all(color: colorE6E6E6)
                  ),
                  child: Icon(s['icon'] as IconData, color: colorPrimary, size: 20),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText.TextMedium(s['lbl'] as String,color: color8D8D94,fontSize: 12.0),

                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildHeader(){
    return Container(
      margin: const EdgeInsets.only(top: 100,left: 16,right: 16,bottom: 6),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colorPrimary,colorPrimary]
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: colorPrimary.withOpacity(0.32),
            blurRadius: 20, offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.TextSemiBold('Welcome back, Ram Das',color: colorWhite),
                    const SizedBox(height: 6),
                    CustomText.TextSemiBold('7 sants are active right now.',color: colorWhite,fontSize: 12.0),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomText.TextSemiBold('📍 Track Live',fontSize: 12.0,color: colorPrimary),
                    ),
                  ],
                ),
              ),

              CustomText.TextRegular('🧘',fontSize: 54.0,color: colorWhite),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    final stats = [
      {'ico': '👤', 'val': '12', 'lbl': 'Total Sants'},
      {'ico': '🛕', 'val': '8',  'lbl': 'Temples'},
      {'ico': '🎪', 'val': '5',  'lbl': 'Events'},
      {'ico': '📍', 'val': '7',  'lbl': 'Live Now'},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.3,
        children: stats.map((s) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade100, width: 1),
              boxShadow: [BoxShadow(
                  color: colorE6E6E6,
                  blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: BoxBorder.all(color: colorE6E6E6)
                  ),
                  child: CustomText.TextSemiBold(s['ico'] as String,color: colorWhite,fontSize: 16.0),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText.TextMedium(s['lbl'] as String,color: color8D8D94,fontSize: 12.0),
                    CustomText.TextSemiBold(s['val'] as String,color: colorPrimary,fontSize: 14.0),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

}

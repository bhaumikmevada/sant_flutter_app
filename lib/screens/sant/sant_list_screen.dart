import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sant_flutter_appp/cubits/internet/internet_cubit.dart';
import 'package:sant_flutter_appp/cubits/internet/internet_state.dart';
import 'package:sant_flutter_appp/utils/StringUtils.dart';

import '../../utils/ColorUtils.dart';
import '../../utils/CustomAppBar.dart';
import '../../utils/CustomText.dart';

class SantListScreen extends StatefulWidget {
  const SantListScreen({super.key});

  @override
  State<SantListScreen> createState() => _SantListScreenState();
}

class _SantListScreenState extends State<SantListScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey,appBar: AppBar(), title: sants,
        isMenuIcon: false,isBackIcon: true,isNotificationIcon: false,isAddIcon: false,
        onAddPress: (){

        },),
      body:BlocBuilder<InternetCubit,InternetState>(

        builder: (context,state){

          if(state is InternetLoading){

          }
          else if(state is InternetConnected){

          }
          else if(state is InternetDisConnected){


          }

          return Container(
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){

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
                          backgroundColor: colorPrimary,
                          child: CustomText.TextRegular("HP",color: colorWhite),
                        ),
                        Positioned(bottom: 0, right: 0,
                            child: Container(width: 12, height: 12,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // color: isOn ? const Color(0xFF22C55E) : Colors.grey.shade400,
                                    color: const Color(0xFF22C55E),
                                    border: Border.all(color: colorWhite, width: 2)))),
                      ]),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.TextMedium("22",color: colorBlack),
                            const SizedBox(height: 3),
                            Row(children: [
                              Icon(Icons.location_on_rounded,
                                  size: 12, color: Colors.grey.shade400),
                              const SizedBox(width: 3),
                              CustomText.TextMedium("location",color: colorText,fontSize: 12.0),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          // color: isOn ? const Color(0xFFECFDF5) : Colors.grey.shade100,
                          color: Color(0xFF88E788),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CustomText.TextMedium(
                            // isOn ? '● Online' : '○ Offline',
                            '● Online',
                            fontSize: 11.0,
                            // color:  isOn ? const Color(0xFF10B981) : Colors.grey.shade400
                            color:  colorBlack
                        ),
                      ),
                    ],
                  ),
                );

              },
            ),
          );

        },

      ),
    );
  }
}

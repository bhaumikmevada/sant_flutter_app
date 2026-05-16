import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/routes/AppRoutes.dart';
import 'package:sant_flutter_appp/utils/StringUtils.dart';

import '../../cubits/internet/internet_cubit.dart';
import '../../cubits/internet/internet_state.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/CustomAppBar.dart';
import '../../utils/CustomText.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey,appBar: AppBar(), title: event,
        isMenuIcon: true,isBackIcon: false,isNotificationIcon: false,isAddIcon: true,
        onAddPress: (){
          context.push(addEventScreenRoute);
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
                      Container(
                        width: 45,
                        padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                        decoration: BoxDecoration(
                            color: colorPrimary,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          children: [

                            CustomText.TextSemiBold("18",color: colorWhite),
                            CustomText.TextRegular("Feb",color: colorWhite,fontSize: 12.0),

                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.TextMedium("Testing",color: colorBlack),
                            const SizedBox(height: 3),
                            Row(children: [
                              Icon(Icons.location_on_rounded,
                                  size: 12, color: Colors.grey.shade400),
                              const SizedBox(width: 3),
                              CustomText.TextRegular("Kashi vishvanath,varanashi",
                                  color: colorHintText,fontSize: 10.0),
                            ]),

                            const SizedBox(height: 5,),
                            Row(
                              children: [

                                Container(
                                  padding:EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
                                  decoration: BoxDecoration(
                                      color: colorFFF4ED,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: CustomText.TextRegular("Puja",fontSize: 10.0,color: colorPrimary),
                                ),

                                // Container(
                                //   margin: EdgeInsets.only(left: 5),
                                //   padding:EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
                                //   decoration: BoxDecoration(
                                //       color: colorEBFDF5,
                                //       borderRadius: BorderRadius.circular(15)
                                //   ),
                                //   child: CustomText.TextRegular("3000+",fontSize: 10.0,color: color065F46),
                                // ),
                                //
                                // Container(
                                //   margin: EdgeInsets.only(left: 5),
                                //   padding:EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
                                //   decoration: BoxDecoration(
                                //       color: colorEBFDF5,
                                //       borderRadius: BorderRadius.circular(15)
                                //   ),
                                //   child: CustomText.TextRegular("Upcoming",fontSize: 10.0,color: color11B981),
                                // ),
                              ],
                            ),

                          ],
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

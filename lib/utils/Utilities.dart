
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'ColorUtils.dart';
import 'CustomText.dart';
import 'ImageUtils.dart';
import 'PreferenceUtils.dart';
import 'StringUtils.dart';
import 'edge_alert/edge_alerts.dart';

enum DatePickerType { onlyCurrent, onlyPast, onlyFuture,allDates }

class Utilities{

  static String getCurrentDateTime({String format = "dd/MM/yyyy"}){
    final now = DateTime.now();
    final formatter = DateFormat(format);
    return formatter.format(now);
  }

  static String getFormattedDate(String inputDate,String inputFormat,String outputFormat){

    try{
      final formatter = DateFormat(inputFormat);
      DateTime dateTime = formatter.parse(inputDate);

      final outputFormatter = DateFormat(outputFormat);
      return outputFormatter.format(dateTime);
    }catch(exception){
      print("Error parsing date : $exception");
      return "";
    }

  }

  static String timeFormat(DateTime dateTime){

    final DateTime now = DateTime.now();
    final Duration diffDuration = now.difference(dateTime);

    if(diffDuration.inMinutes < 60){
      return "${diffDuration.inMinutes} min";
    }
    else if(diffDuration.inHours < 24){
      final int hours = diffDuration.inHours;
      final int minute = diffDuration.inMinutes % 60;
      return minute > 0 ? "$hours hour${hours > 1 ? 's' : ''} $minute min" :
      "$hours hour${hours > 1 ? 's' : ''}";
    }
    else{
      final int days = diffDuration.inDays;
      return "$days day${days > 1 ? 's' : ''}";
    }
  }


  static void showEdgeAlert(BuildContext context,String description,bool isSuccess){
    edgeAlert(
      context,
      title: appName,
      description: description,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      gravity: Gravity.top,
      icon: isSuccess ? Icons.verified :  Icons.error,
    );
  }

  static void showNoInternet(BuildContext context){
    showEdgeAlert(context, noInternet, false);
  }

  static Widget showCircularProgress({Color color = colorPrimary,bool isDarkMode = true}){
    return CircularProgressIndicator(color: isDarkMode ? colorWhite : color);
  }

  static Color parseColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    return Color(int.parse("0xFF$hexColor"));
  }

  static Widget buildLogo() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [colorPrimary, const Color(0xFFFB923C)],
            ),
            boxShadow: [
              BoxShadow(
                color: colorPrimary.withOpacity(0.38),
                blurRadius: 22,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Shine overlay
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.18),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(appLogo, width: 40, height: 40),
                    const SizedBox(height: 4),
                    const Text(
                      'संतapp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Sant',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: colorBlack,
                  letterSpacing: -0.5,
                ),
              ),
              TextSpan(
                text: 'App',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: colorPrimary,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static void showAlertDialog(BuildContext context, String message,VoidCallback okListener,{String title = appName}){

    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title:Container(
            alignment:Alignment.topLeft,
            child: CustomText.TextBold(title,color: colorBlack,fontSize: 16.0),
          ),
          content:CustomText.TextMedium(message,color: colorBlack,fontSize: 15.0,maxLine: 50),
          actions: [
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: okListener,
                child: CustomText.TextMedium("Ok",color: colorPrimary,fontSize: 16.0),
              ),
            )
          ],
        );
      }
    );

  }

  static void showConfirmAlertDialog(BuildContext context, String message,VoidCallback okListener,{String title = appName,
  String btnYesText = yes,String btnNoText = no,bool isDarkMode = false}){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: CustomText.TextBold(title,color:isDarkMode ? colorWhite : colorText,fontSize: 18.0),
            content:CustomText.TextMedium(message,color:isDarkMode ? colorWhite : colorText,fontSize: 14.0,maxLine: 4),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            backgroundColor: isDarkMode ? colorBlack : colorWhite,
            actionsPadding: EdgeInsets.zero,
            actions: [

              Container(
                margin: EdgeInsets.only(bottom: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: okListener,
                      child: CustomText.TextMedium(btnYesText, color: isDarkMode ? colorWhite :colorText, fontSize: 16.0),
                    ),
                    const SizedBox(width: 1), // Adjust spacing here
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: CustomText.TextMedium(btnNoText, color:isDarkMode ? colorWhite : colorText, fontSize: 16.0),
                    ),
                  ],
                ),
              )

            ],
          );
        }
    );

  }

  static void showUnAuthorizedDialog(BuildContext context,{String message = "UnAuthorized User!",String title = appName}){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            title: CustomText.TextBold(title,color: colorPrimary,fontSize: 18.0),
            content:CustomText.TextMedium(message,color: colorPrimary,fontSize: 16.0),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  PreferenceUtils.clearAllPref();
                  // AppRoutes.navigatedPushReplacementNamed(context, loginScreenRoute);
                },
                child: CustomText.TextMedium("Ok",color: colorPrimary,fontSize: 16.0),
              ),
            ],
          );
        }
    );

  }
  static Future<TimeOfDay?> showTimePickerDialog(BuildContext context,{bool isOnlyCurrentTime = true}) async{
    TimeOfDay now = TimeOfDay.now();

    TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        builder: (context,child){
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: colorPrimary,
                  onSurface: colorPrimary,
                ),
                timePickerTheme: TimePickerThemeData(
                  dayPeriodColor: colorB2B6C5,
                  dayPeriodTextColor: colorPrimary,
                )
              ),
              child: child!
          );
        },
        initialTime: now
    );

    if(isOnlyCurrentTime){
      if (timeOfDay != null) {
        if (timeOfDay.hour > now.hour ||
            (timeOfDay.hour == now.hour && timeOfDay.minute > now.minute)) {
          showEdgeAlert(context, validationCurrentTime, false);
          return await showTimePickerDialog(context); // Ask again if invalid
        }
      }
    }

    return timeOfDay;
  }

  static Future<DateTime?> showDatePickerDialog(BuildContext context,
      {DatePickerType datePickerType = DatePickerType.allDates})async {

    final firstDate;
    final lastDate;

    if(datePickerType == DatePickerType.onlyCurrent){
      firstDate = DateTime.now();
      lastDate = DateTime.now();
    }
    else if(datePickerType == DatePickerType.onlyPast){
      firstDate = DateTime(1980);
      lastDate = DateTime.now();
    }
    else if(datePickerType == DatePickerType.onlyFuture){
      firstDate = DateTime.now();
      lastDate = DateTime(2100);
    }else{
      firstDate = DateTime(1980);
      lastDate = DateTime(2100);
    }

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context,child){
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColorLight: Colors.red,
              colorScheme: const ColorScheme.light(primary: colorPrimary)
            ),
            child: child!
        );

      },

    );

    return pickedDate;
  }


  static void showToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  static double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295; // conversion factor from degrees to radians
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p)) / 2;

    var radiusOfEarth = 6371; // Earth's radius in kilometers
    var distanceInKm = radiusOfEarth * 2 * asin(sqrt(a));

    // Convert the distance from kilometers to meters
    var distanceInMeters = distanceInKm * 1000;

    return distanceInMeters;
  }


}
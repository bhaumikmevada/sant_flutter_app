
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ColorUtils.dart';
import 'CustomText.dart';
import 'PreferenceUtils.dart';
import 'StringUtils.dart';

class CustomLoader{

  static void showLoadingDialog(BuildContext context,bool isShowDialog){

    String loadingLbl = loadingDialog;

    if(isShowDialog){

      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colorWhite
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const CircularProgressIndicator(color: colorPrimary,),

                        const SizedBox(height: 10,),

                        CustomText.TextMedium(loadingLbl),

                      ],
                    ),
                  )

                ],
              ),
            );
          }
      );

    }else{
      Navigator.of(context).pop();
    }
    
  }

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
                ),
                const SizedBox(height: 16),
                Text(
                  'Loading...',
                  style: TextStyle(color: colorPrimary, fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
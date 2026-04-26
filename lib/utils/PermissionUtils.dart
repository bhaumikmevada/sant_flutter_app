

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'ColorUtils.dart';
import 'CustomText.dart';
import 'StringUtils.dart';
import 'Utilities.dart';

class PermissionUtils{

  static final PermissionUtils _instance = PermissionUtils._internal();
  factory PermissionUtils()=> _instance;
  PermissionUtils._internal();

  Future<void> requestPermission({
    required BuildContext context,
    String title = permissionSettingDialogTitle,
    String msg = permissionSettingDialogMsg,
    String error = permissionSettingDialogError,
    String okBtn = permissionSettingOkBtn,
    String cancelBtn = permissionSettingCancelBtn,
    bool isSplash = false,
    required List<Permission> permissionList,
    Function(bool isGranted)? onPermissionGranted,
    Function()? onPermissionDenied,
  }) async{

    Map<Permission,PermissionStatus> status = await permissionList.request();

    if(status.values.every((permission) => permission.isGranted)){
      debugPrint("All Permission Granted");
      onPermissionGranted?.call(true);

    }
    else if(status.values.any((permission) => permission.isPermanentlyDenied)){
     if(Platform.isAndroid){
       if(isSplash == false){
         _showOpenAppSettingsDialog(context,title,msg,cancelBtn,okBtn,error);
       }
     }
      onPermissionDenied?.call();
    }else{
      await permissionList.request();
      onPermissionDenied?.call();
    }

  }
  Future<void> _showOpenAppSettingsDialog(BuildContext context,String title,String msg,String cancelBtn,String okBtn,String errorMsg) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText.TextSemiBold(title,fontSize: 16.0),
          content: CustomText.TextRegular(msg,color: colorText),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: CustomText.TextMedium(cancelBtn),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                final bool isOpened = await openAppSettings();
                if (!isOpened) {
                  Utilities.showEdgeAlert(context, errorMsg, false);
                }
              },
              child: CustomText.TextMedium(okBtn),
            ),
          ],
        );
      },
    );
  }

}
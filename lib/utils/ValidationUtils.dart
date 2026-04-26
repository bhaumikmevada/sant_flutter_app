
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';

import 'Utilities.dart';
class ValidationUtils{


  static bool inputValidation(BuildContext context,TextEditingController controller, String message){

    if(controller.text.isEmpty){
      Utilities.showEdgeAlert(context, message, false);
      return false;
    }
    return true;
  }

  static bool emailValidation(BuildContext context,TextEditingController controller,String emptyMsg,String invalidMsg){

    if(controller.text.isEmpty){
      Utilities.showEdgeAlert(context, emptyMsg, false);
      return false;
    }
    else if(!EmailValidator.validate(controller.text)){
      Utilities.showEdgeAlert(context, invalidMsg, false);
      return false;
    }
    return true;
  }

  static bool passwordValidation(BuildContext context,TextEditingController controller,String emptyMsg){

    if(controller.text.isEmpty){
      Utilities.showEdgeAlert(context, emptyMsg, false);
      return false;
    }

    return true;
  }

  static bool passwordCharacterValidation(BuildContext context,TextEditingController controller,String emptyMsg,
      String invalidMsg){

    if(controller.text.isEmpty){
      Utilities.showEdgeAlert(context, emptyMsg, false);
      return false;
    }
    else if(controller.text.length < 6){
      Utilities.showEdgeAlert(context, invalidMsg, false);
      return false;
    }

    return true;
  }

  static bool conformPasswordValidation(BuildContext context,TextEditingController password,
    TextEditingController confirmPassword,String emptyMsg){

    if(password.value.text != confirmPassword.value.text){
      Utilities.showEdgeAlert(context, emptyMsg, false);
      return false;
    }

    return true;
  }

  static bool mobileNoValidation(BuildContext context,TextEditingController controller,String emptyMsg,String invalidMsg){

    if(controller.text.isEmpty){
      Utilities.showEdgeAlert(context, emptyMsg, false);
      return false;
    }
    /*else if(controller.text.length < 10){
      Utilities.showEdgeAlert(context, invalidMsg, false);
      return false;
    }*/

    return true;
  }

}
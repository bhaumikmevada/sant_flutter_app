import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/utils/ColorUtils.dart';
import 'package:sant_flutter_appp/utils/CustomText.dart';
import 'package:sant_flutter_appp/utils/StringUtils.dart';
import 'package:sant_flutter_appp/utils/Utilities.dart';
import 'package:sant_flutter_appp/utils/dob_input_formater.dart';

import '../../utils/CustomAppBar.dart';
import '../../utils/CustomButton.dart';
import '../../utils/CustomTextFormField.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with SingleTickerProviderStateMixin {

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: CustomAppBar(appBar: AppBar(), title: resetPassword,isBackIcon: true,),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
                Utilities.buildLogo(),
          
                const SizedBox(height: 28),
                CustomTextFormField(
                    controller: newPasswordController,
                    hintText: newPasswordHint,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    prefixIcon: Icon(Icons.lock_outline_rounded,color: colorPrimary,size: 22,),
                    obscureText: true,
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height: 10),
          
                CustomTextFormField(
                    controller: confirmPasswordController,
                    hintText: confirmPasswordHint,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    prefixIcon: Icon(Icons.lock_outline_rounded,color: colorPrimary,size: 22,),
                    obscureText: true,
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height:20,),
          
                CustomButton(
                  text: submit,
                  callback: (){
          
                  },
                ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildSignInRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account? ",
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            'Sign In!',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: colorPrimary),
          ),
        ),
      ],
    );
  }
}

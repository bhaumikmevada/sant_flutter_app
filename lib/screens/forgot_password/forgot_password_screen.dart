import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/utils/ColorUtils.dart';
import 'package:sant_flutter_appp/utils/CustomAppBar.dart';
import 'package:sant_flutter_appp/utils/CustomButton.dart';
import 'package:sant_flutter_appp/utils/CustomTextFormField.dart';
import 'package:sant_flutter_appp/utils/ImageUtils.dart';

import '../../cubits/internet/internet_cubit.dart';
import '../../cubits/internet/internet_state.dart';
import '../../routes/AppRoutes.dart';
import '../../utils/CustomText.dart';
import '../../utils/SharedState.dart';
import '../../utils/StringUtils.dart';
import '../../utils/Utilities.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  final phoneNoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: CustomAppBar(appBar: AppBar(), title: forgotPasswordTitle,isBackIcon: true,),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Utilities.buildLogo(),
                const SizedBox(height: 20),
                CustomTextFormField(
                    controller: phoneNoController,
                    hintText: phoneNo,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    isPrefixIcon: true,
                    isMobileNo: true,
                    prefixIcon: Icon(Icons.phone,color: colorPrimary,size: 22,),
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height: 20),
          
                CustomButton(
                  text: next,
                  callback: (){
                    context.push(otpScreenRoute);
                  },
                ),
          
          
              ],
            ),
          ),
        ),
      ),
    );
  }



}
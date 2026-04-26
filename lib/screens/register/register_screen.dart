import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/utils/ColorUtils.dart';
import 'package:sant_flutter_appp/utils/CustomText.dart';
import 'package:sant_flutter_appp/utils/StringUtils.dart';
import 'package:sant_flutter_appp/utils/Utilities.dart';

import '../../utils/CustomAppBar.dart';
import '../../utils/CustomButton.dart';
import '../../utils/CustomTextFormField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: CustomAppBar(appBar: AppBar(), title: createAccountTitle,isBackIcon: true,),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Utilities.buildLogo(),

                const SizedBox(height: 28),

                CustomTextFormField(
                    controller: firstNameController,
                    hintText: firstName,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    prefixIcon: Icon(Icons.person_outline_rounded,color: colorPrimary,size: 22,),
                    onChange: (value){},
                    onTap:() {}
                ),

                const SizedBox(height: 10),

                // ── Password Field ──
                CustomTextFormField(
                    controller: lastNameController,
                    hintText: lastName,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    prefixIcon: Icon(Icons.person_outline_rounded,color: colorPrimary,size: 22,),
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    controller: emailController,
                    hintText: emailHint,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    prefixIcon: Icon(Icons.email_outlined,color: colorPrimary,size: 22,),
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    controller: phoneController,
                    hintText: phoneNo,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    isMobileNo: true,
                    prefixIcon: Icon(Icons.phone,color: colorPrimary,size: 22,),
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    controller: passwordController,
                    hintText: passwordHint,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    prefixIcon: Icon(Icons.lock_outline_rounded,color: colorPrimary,size: 22,),
                    obscureText: true,
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height:10,),
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
                  text: signUp,
                  callback: (){

                  },
                ),

                const SizedBox(height: 32),

                _buildSignInRow()
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/routes/AppRoutes.dart';
import 'package:sant_flutter_appp/utils/CustomButton.dart';
import 'package:sant_flutter_appp/utils/CustomText.dart';
import 'package:sant_flutter_appp/utils/StringUtils.dart';

import '../../utils/ColorUtils.dart';
import '../../utils/CustomAppBar.dart';
import '../../utils/Utilities.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  int _secondsRemaining = 30;
  bool _enableResend = false;
  Timer? _timer;

  String otpCode = "";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 30;
    _enableResend = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          _enableResend = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _resendOtp() {
    print("OTP Resent");
    _startTimer();
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: CustomAppBar(appBar: AppBar(), title: otpTitle,isBackIcon: true,),
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
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: colorPrimary,
                  focusedBorderColor: colorPrimary,
                  contentPadding: EdgeInsets.all(10),
                  showFieldAsBox: true,
                  onSubmit: (String verificationCode) {
                    otpCode = verificationCode;
                  },
                ),

                const SizedBox(height: 20),
                _enableResend
                    ? GestureDetector(
                  onTap: _resendOtp,
                  child: CustomText.TextRegular("Resend OTP",color: colorPrimary),
                )
                    : CustomText.TextRegular(
                  "Resend OTP in $_secondsRemaining sec", color: colorPrimary,
                ),

                const SizedBox(height: 20),

                CustomButton(
                  text: verify,
                  callback: (){
                    context.push(resetPasswordScreenRoute);
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

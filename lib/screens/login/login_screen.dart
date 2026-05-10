import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/utils/ColorUtils.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  final phoneNoController = TextEditingController();
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
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state is InternetConnected) {
            isConnectedInternet = true;
          } else if (state is InternetDisConnected) {
            isConnectedInternet = false;
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 52),

                    // ── Logo ──
                    Utilities.buildLogo(),

                    const SizedBox(height: 20),

                    // ── Title ──
                    Text(
                      'Welcome Back 👋',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: colorBlack,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    CustomText.TextRegular('Sign in to continue your journey',color: Colors.grey.shade500),

                    const SizedBox(height: 32),

                    // ── Email Field ──
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

                    const SizedBox(height: 14),
                    // ── Forgot Password ──
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          context.push(forgotPasswordScreenRoute);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: CustomText.TextBold(forgotPassword,color: colorPrimary,fontSize: 12.0),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // ── Login Button ──
                    CustomButton(
                      text: login,
                      callback: (){
                        context.go(homeScreenRoute);
                      },
                    ),

                    const SizedBox(height: 24),

                    // ── Divider ──
                    _buildDivider('or sign in with'),

                    const SizedBox(height: 18),

                    // ── Google Button ──
                    _buildSocialButton(
                      backgroundColor: const Color(0xFF1C1C1E),
                      onTap: () async {
                        // Google login
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                imgGoogle,
                                width: 18,
                                height: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          const Text(
                            signInWithGoogle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ── Facebook Button ──
                    _buildSocialButton(
                      backgroundColor: const Color(0xFF1877F2),
                      onTap: () async {
                        // Facebook login
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.facebook_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                          const SizedBox(width: 14),
                          const Text(
                            signInWithFacebook,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ── Sign Up Row ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.push(registerScreenRoute);
                          },
                          child: Text(
                            signUp,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: colorPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }



  // ─────────────────────────────────────────────
  //  DIVIDER
  // ─────────────────────────────────────────────
  Widget _buildDivider(String label) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade200, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade400,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade200, thickness: 1)),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  SOCIAL BUTTON
  // ─────────────────────────────────────────────
  Widget _buildSocialButton({
    required Color backgroundColor,
    required VoidCallback onTap,
    required Widget child,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(50),
          child: Center(child: child),
        ),
      ),
    );
  }
}
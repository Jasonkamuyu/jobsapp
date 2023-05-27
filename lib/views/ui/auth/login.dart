import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/custom_btn.dart';
import 'package:jobhub/views/common/custom_textfield.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/ui/auth/signup.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustomAppBar(
                    text: "Login",
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(CupertinoIcons.arrow_left),
                    ))),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView(padding: EdgeInsets.zero, children: [
                  const HeightSpacer(size: 50),
                  ReusableText(
                      text: "Welcome Back",
                      style: appstyle(30, kDark, FontWeight.w600)),
                  ReusableText(
                      text: "Fill the Details to Login to Your Account",
                      style: appstyle(20, kDarkGrey, FontWeight.w200)),
                  const HeightSpacer(size: 50),
                  CustomTextField(
                    controller: email,
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.isEmpty || !email.contains("@")) {
                        return "Please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomTextField(
                    controller: password,
                    hintText: "Password",
                    obscureText: loginNotifier.obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 7) {
                        return "Please enter a password";
                      }
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        loginNotifier.obscureText = !loginNotifier.obscureText;
                      },
                      child: Icon(
                        loginNotifier.obscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: kDark,
                      ),
                    ),
                  ),
                  const HeightSpacer(size: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const RegistrationPage());
                      },
                      child: ReusableText(
                          text: "Register",
                          style: appstyle(14, kDark, FontWeight.w500)),
                    ),
                  ),
                  const HeightSpacer(size: 50),
                  CustomButton(
                    onTap: () {},
                    text: "Login",
                  )
                ])));
      },
    );
  }
}

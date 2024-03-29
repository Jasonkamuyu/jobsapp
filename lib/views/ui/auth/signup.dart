import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../common/app_bar.dart';
import '../../common/app_style.dart';
import '../../common/custom_btn.dart';
import '../../common/custom_textfield.dart';
import '../../common/height_spacer.dart';
import '../../common/reusable_text.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(
      builder: (context, signUpNotifier, child) {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustomAppBar(
                    text: "Register",
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
                      text: "Hello, Welcome to JASON JOBS",
                      style: appstyle(30, kDark, FontWeight.w600)),
                  ReusableText(
                      text: "Fill the Details to Login to Your Account",
                      style: appstyle(20, kDarkGrey, FontWeight.w200)),
                  const HeightSpacer(size: 50),
                  CustomTextField(
                    controller: name,
                    hintText: "Username",
                    keyboardType: TextInputType.name,
                    validator: (name) {
                      if (name!.isEmpty) {
                        return "Please enter your Username";
                      } else {
                        return null;
                      }
                    },
                  ),
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
                  const HeightSpacer(size: 50),
                  CustomTextField(
                    controller: password,
                    hintText: "Password",
                    obscureText: signUpNotifier.isObsecure,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (password) {
                      if (signUpNotifier.passwordValidator(password ?? '')) {
                        return "Please Enter Password With Atleast one Uppercase, one Lowercase, one number, special character and password should be more than 8 characters";
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        signUpNotifier.isObsecure = !signUpNotifier.isObsecure;
                      },
                      child: Icon(
                        signUpNotifier.isObsecure
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
                        Get.to(() => const LoginPage());
                      },
                      child: ReusableText(
                          text: "Login",
                          style: appstyle(14, kDark, FontWeight.w500)),
                    ),
                  ),
                  const HeightSpacer(size: 50),
                  CustomButton(
                    onTap: () {},
                    text: "SIGN UP",
                  )
                ])));
      },
    );
  }
}

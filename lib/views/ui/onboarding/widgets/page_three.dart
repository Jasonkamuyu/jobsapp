import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhub/views/common/custom_outline_btn.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/ui/auth/login.dart';
import 'package:jobhub/views/ui/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/app_constants.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: width,
        height: hieght,
        color: Color(kLightBlue.value),
        child: Column(
          children: [
            Image.asset("assets/images/page3.png"),
            const HeightSpacer(size: 20),
            ReusableText(
                text: "Welcome", style: appstyle(30, kLight, FontWeight.w600)),
            const HeightSpacer(size: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                "We Help you find your Dream Job to your skillset, location and Prefference",
                textAlign: TextAlign.center,
                style: appstyle(14, kLight, FontWeight.normal),
              ),
            ),
            const HeightSpacer(size: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomOutlineBtn(
                  onTap: () async {
                    final SharedPreferences preferences =
                        await SharedPreferences.getInstance();

                    await preferences.setBool('entryPoint', true);
                    Get.to(() => const LoginPage());
                  },
                  text: "Login",
                  width: width * 0.4,
                  height: hieght * 0.06,
                  color: Color(kLight.value),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const RegistrationPage());
                  },
                  child: Container(
                    width: width * 0.4,
                    height: hieght * 0.06,
                    color: Color(kLight.value),
                    child: Center(
                      child: ReusableText(
                          text: "Sign Up",
                          style: appstyle(16, kLightBlue, FontWeight.w600)),
                    ),
                  ),
                )
              ],
            ),
            const HeightSpacer(size: 30),
            ReusableText(
                text: "Continue as Guest",
                style: appstyle(16, kLight, FontWeight.w400))
          ],
        ),
      ),
    );
  }
}

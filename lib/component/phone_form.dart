import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/animation/fade_in_up.dart';
import 'package:otp_app/component/custom_button.dart';
import 'package:otp_app/component/phone_field.dart';
import 'package:otp_app/screen/verification_page.dart';
import 'package:otp_app/theme/colors.dart';

class PhoneForm extends StatefulWidget {
  const PhoneForm({super.key});

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 700),
      child: Column(
        children: [
          const PhoneField(),
          const Gap(24),
          CustomButton(
            text: "Send OTP",
            onTap: () {
              Get.to(() => const VerificationPage(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 500));
            },
          ),
          const Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have account? ",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  color: white,
                ),
              ),
              Text(
                "Create Account",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  color: secondaryColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

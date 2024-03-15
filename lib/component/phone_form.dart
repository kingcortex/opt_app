import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/animation/fade_in_up.dart';
import 'package:otp_app/component/custom_button.dart';
import 'package:otp_app/component/phone_field.dart';
import 'package:otp_app/screen/verification_page.dart';
import 'package:otp_app/service/auth_service.dart';
import 'package:otp_app/service/num_service.dart';
import 'package:otp_app/theme/colors.dart';

class PhoneForm extends StatefulWidget {
  const PhoneForm({super.key});

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  StreamController<bool> isClicableStreamController = StreamController<bool>();
  StreamController<bool> isLoadingStreamController = StreamController<bool>();
  TextEditingController phoneController = TextEditingController();
  String numberCode = "";

  @override
  void initState() {
    isClicableStreamController.add(false);
    isLoadingStreamController.add(false);
    super.initState();
  }

  void getNumbeCode(String code) {
    numberCode = code;
  }

  sendCode() {
    isLoadingStreamController.add(true);
    AuthService.authWithPhoneNumber(
      phoneNumber:
          NumService.getCompleteNumber(numberCode, phoneController.text),
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (exception) {
        isLoadingStreamController.add(false);
        print(exception);
      },
      codeSent: (verificationId, p1) {
        isLoadingStreamController.add(false);
        Get.to(() => const VerificationPage());
      },
      codeAutoRetrievalTimeout: (s) {
        print("s");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 700),
      child: Column(
        children: [
          PhoneField(
            onChange: (value) {
              isClicableStreamController.add(phoneController.text.length == 10);
            },
            listCountryCode: const <String>[
              '+225', // Côte d'Ivoire
              '+229', // Bénin
              '+226', // Burkina Faso
              '+224', // Guinée
            ],
            getNumberCode: (code) => getNumbeCode(code),
            controller: phoneController,
          ),
          const Gap(24),
          CustomButton(
            isLoadingStreamController: isLoadingStreamController,
            isClicableStreamController: isClicableStreamController,
            text: "Send OTP",
            onTap: () {
              sendCode();
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

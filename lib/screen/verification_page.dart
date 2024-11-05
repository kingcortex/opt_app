import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/screen/phone_page.dart';
import 'package:otp_app/screen/success_page.dart';
import 'package:otp_app/service/auth_service.dart';
import 'package:otp_app/service/num_service.dart';
import 'package:otp_app/theme/colors.dart';
import 'package:pinput/pinput.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  String verificationId = Get.arguments["verificationId"];
  final String numberPhone = Get.arguments["phoneNumber"];
  bool canRessend = false;
  int counterBase = 15;
  int counter = 15;

  late Timer timer;

  @override
  void initState() {
    muniteur();
    super.initState();
  }

  void muniteur() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (counter < 1) {
          timer.cancel();
          counterBase += 15;
          counter = counterBase;
          canRessend = true;
          setState(() {});
          return;
        }
        counter--;
        setState(() {});
      },
    );
  }

  void ressend() {
    AuthService.authWithPhoneNumber(
      phoneNumber: numberPhone,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (exception) {
        print(exception);
      },
      codeSent: (verificationId_, p1) {
        verificationId = verificationId_;
      },
      codeAutoRetrievalTimeout: (s) {
        print("s");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              buildAppBar(context),
              const Gap(22),
              Text(
                "Enter 6 digit verification code sent to your phone number",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
              ),
              const Gap(32),
              Pinput(
                onCompleted: (value) {
                  AuthService.verificationOtp(verificationId, value,
                      onFailed: () {
                    popUp(context);
                  });
                },
                defaultPinTheme: PinTheme(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: GoogleFonts.plusJakartaSans(
                      fontSize: 16, fontWeight: FontWeight.w600, color: white),
                ),
                length: 6,
              ),
              const Gap(24),
              canRessend == true
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          canRessend = false;
                        });
                        muniteur();
                      },
                      child: Text(
                        "Ressend code  ",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: secondaryColor,
                        ),
                      ),
                    )
                  : Text(
                      "Resend code  $counter",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildAppBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            alignment: Alignment.center,
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: const Color(0xff464748),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: white,
            ),
          ),
        ),
        Text(
          "Phone Verification",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: white,
          ),
        ),
        const Gap(32)
      ],
    ),
  );
}

void popUp(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Icon(CupertinoIcons.info),
        content: const Text(
          "the code entered is incorrect",
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () => Get.back(),
          )
        ],
      );
    },
  );
}

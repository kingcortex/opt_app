import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/animation/fade_in_up.dart';
import 'package:otp_app/component/custom_button.dart';
import 'package:otp_app/theme/colors.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({super.key});

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  StreamController<bool> isClicableStreamController = StreamController<bool>();
  StreamController<bool> isLoadingStreamController = StreamController<bool>();
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 700),
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                style: GoogleFonts.plusJakartaSans(color: white),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter your email",
                  hintStyle: GoogleFonts.plusJakartaSans(
                    color: Colors.white24,
                  ),
                ),
              ),
            ),
          ),
          const Gap(24),
          CustomButton(
            isLoadingStreamController: isLoadingStreamController,
            isClicableStreamController: isClicableStreamController,
            text: "Send Code",
            onTap: () {},
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

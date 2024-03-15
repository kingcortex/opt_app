import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/theme/colors.dart';
import 'package:pinput/pinput.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
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
              Text(
                "Resend code",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor,
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

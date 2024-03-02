import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/component/email_form.dart';
import 'package:otp_app/component/phone_form.dart';
import 'package:otp_app/theme/colors.dart';

class PhonePage extends StatelessWidget {
  const PhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(MediaQuery.of(context).size.height * 0.0394),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.39,
                    width: MediaQuery.of(context).size.height * 0.39,
                    child: Image.asset("assets/ob_bg.png"),
                  ),
                ],
              ),
              const AuthSection()
            ],
          ),
        ),
      ),
    );
  }
}

class AuthSection extends StatefulWidget {
  const AuthSection({super.key});

  @override
  State<AuthSection> createState() => _AuthSectionState();
}

class _AuthSectionState extends State<AuthSection> {
  int? groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Login to your account",
            style: GoogleFonts.plusJakartaSans(
              color: white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          Gap(MediaQuery.of(context).size.height * 0.0344),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: CupertinoSlidingSegmentedControl<int>(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.00492),
              backgroundColor: const Color(0xff323334),
              groupValue: groupValue,
              onValueChanged: (value) {
                setState(() {
                  groupValue = value;
                });
              },
              children: {
                0: buildSegment(index: 0, "Email"),
                1: buildSegment(index: 1, "Phone Number")
              },
            ),
          ),
          Gap(MediaQuery.of(context).size.height * 0.0341),
          groupValue == 0 ? const EmailForm() : const PhoneForm(),
        ],
      ),
    );
  }

  Widget buildSegment(String text, {required int index}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.plusJakartaSans(
          color: groupValue == index ? const Color(0xff323334) : white,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}

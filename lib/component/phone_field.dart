import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/theme/colors.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({super.key});

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  TextEditingController phoneController = TextEditingController();
  List<String> numberCodes = [
    '+225', // Côte d'Ivoire
    '+229', // Bénin
    '+226', // Burkina Faso
    '+224', // Guinée
  ];
  late String selectedCode;

  @override
  void initState() {
    selectedCode = numberCodes[0];
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Container(
            width: 68,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white24),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              underline: const SizedBox(),
              dropdownColor: primaryColor,
              focusColor: white,
              value: selectedCode,
              onChanged: (value) {
                setState(() {
                  selectedCode = value!;
                });
              },
              items: numberCodes
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 12, color: white, fontWeight: FontWeight.w600),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: phoneController,
                style:
                    GoogleFonts.plusJakartaSans(color: white, letterSpacing: 4),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  hintStyle: GoogleFonts.plusJakartaSans(
                    color: Colors.white24,
                    letterSpacing: 0.5,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/theme/colors.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController controller;
  final List<String> listCountryCode;
  final Function(String) getNumberCode;
  final Function(String)? onChange;
  const PhoneField(
      {super.key,
      required this.controller,
      required this.getNumberCode,
      required this.listCountryCode,
      this.onChange});

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late String selectedCode;

  @override
  void initState() {
    selectedCode = widget.listCountryCode[0];
    widget.getNumberCode(selectedCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Container(
            height: 48,
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
                widget.getNumberCode(selectedCode);
              },
              items: widget.listCountryCode
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
                onChanged: (value) {
                  print("ok");
                  widget.onChange!(value);
                },
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: widget.controller,
                style: GoogleFonts.plusJakartaSans(
                  color: white,
                ),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "Enter your phone number",
                  hintStyle: GoogleFonts.plusJakartaSans(
                    color: Colors.white24,
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

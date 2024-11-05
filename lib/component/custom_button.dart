import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_app/theme/colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function()? onTap;
  final StreamController<bool> isClicableStreamController;
  final StreamController<bool> isLoadingStreamController;
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    required this.isClicableStreamController,
    required this.isLoadingStreamController,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.isClicableStreamController.stream,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: snapshot.data == true ? widget.onTap : null,
          child: StreamBuilder<bool>(
              stream: widget.isLoadingStreamController.stream,
              builder: (context, snapshot1) {
                return Container(
                  alignment: Alignment.center,
                  height: 48,
                  decoration: BoxDecoration(
                    color: snapshot.data == true ? secondaryColor : Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: snapshot1.data == false
                      ? Text(
                          widget.text,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        )
                      : const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                );
              }),
        );
      },
    );
  }
}

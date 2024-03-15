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
        if (snapshot.data == true) {
          return GestureDetector(
            onTap: widget.onTap,
            child: StreamBuilder<bool>(
                stream: widget.isLoadingStreamController.stream,
                builder: (context, snapshot) {
                  return Container(
                    alignment: Alignment.center,
                    height: 48,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: snapshot.data == false
                        ? Text(
                            widget.text,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          )
                        : const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                  );
                }),
          );
        }
        return Container(
          alignment: Alignment.center,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            widget.text,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
        );
      },
    );
  }
}

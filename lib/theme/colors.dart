import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff202020);
Color secondaryColor = const Color(0xffFE8723);
Color white = const Color(0xffffffff);




/**
  Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (indexPage != 0) {
                          setState(() {
                            indexPage = 0;
                          });
                          pageController.jumpTo(0);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              indexPage == 0 ? white : const Color(0xff464748),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Email",
                          style: GoogleFonts.plusJakartaSans(
                            color: indexPage == 0
                                ? const Color(0xff323334)
                                : white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (indexPage != 1) {
                          setState(() {
                            indexPage = 1;
                          });
                          pageController.jumpTo(1);
                        }
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 800),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              indexPage == 1 ? white : const Color(0xff464748),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Phone Number",
                          style: GoogleFonts.plusJakartaSans(
                            color: indexPage == 1
                                ? const Color(0xff323334)
                                : white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
 */
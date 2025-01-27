import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Get.height,
      child: Container(
        color: const Color(0xFFC5382E),
        child: Text(
          'NewsApp',
          style: GoogleFonts.nosifer(color: Colors.white, fontSize: 32.0),
        ),
      ),
    );
  }
}

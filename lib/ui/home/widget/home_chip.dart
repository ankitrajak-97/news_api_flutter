import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/utils/style/app_dimen.dart';

class HomeChip extends StatelessWidget {
  final String chipTitle;
  final VoidCallback onTap;
  const HomeChip({
    super.key,
    required this.chipTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: kHeight * 5,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(kRadius),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(kPadding),
            child: Text(
              chipTitle,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

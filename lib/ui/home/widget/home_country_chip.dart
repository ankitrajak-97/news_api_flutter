import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/utils/style/app_dimen.dart';

class HomeCountryChip extends StatelessWidget {
  final String shortName;
  final String flagPath;
  final VoidCallback onCountryButtonClick;
  const HomeCountryChip({
    super.key,
    required this.onCountryButtonClick,
    required this.shortName,
    required this.flagPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCountryButtonClick,
      borderRadius: BorderRadius.circular(kRadius * 10),
      child: Container(
        width: kWidth * 10,
        height: kHeight * 5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(kRadius * 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              flagPath,
              height: kHeight * 2,
              width: kHeight * 2,
            ),
            Text(
              shortName,
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

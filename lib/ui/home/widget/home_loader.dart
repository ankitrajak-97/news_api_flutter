import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/utils/style/app_dimen.dart';

class HomeLoader extends StatelessWidget {
  const HomeLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 1.0,
        ),
        SizedBox(
          height: kHeight,
        ),
        Text(
          'Fetching data. Please wait',
          style: GoogleFonts.nanumGothic(
            color: Colors.white70,
            fontSize: 12.0,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}

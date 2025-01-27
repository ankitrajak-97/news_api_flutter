import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/utils/style/app_dimen.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            width: kWidth * 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(kPadding),
                  height: kHeight * 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(kRadius * 2),
                    ),
                    child: Image.network(
                      'https://thehill.com/wp-content/uploads/sites/2/2025/01/Screenshot-2025-01-26-at-8.27.00 AM.png?w=1280',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Author: Nirjan Munshi',
                    style: GoogleFonts.roboto(
                      fontSize: 8.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                      height: 1.1,
                      color: Colors.white24,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              children: [
                Text(
                  'About 70 people killed in attack on hospital in Sudan’s Darfur region, WHO chief says - The Associated Press',
                  style: GoogleFonts.roboto(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1,
                    height: 1.1,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: kHeight,
                ),
                Text(
                  "Around 70 people were killed in an attack on the only functional hospital in the besieged city of El Fasher in Sudan. That's according to the chief of the World Health Organization. WHO Director-General Tedros Adhanom Ghe breyesus offered the figure in a X pos…",
                  style: GoogleFonts.roboto(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w200,
                    height: 1.4,
                    color: Colors.white,
                  ),
                  softWrap: true,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

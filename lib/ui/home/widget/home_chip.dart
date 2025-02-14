import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/utils/style/app_dimen.dart';

class HomeCategoryChip extends StatelessWidget {
  final String chipTitle;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showCategory;
  const HomeCategoryChip({
    super.key,
    required this.chipTitle,
    required this.onTap,
    this.isSelected = false,
    this.showCategory = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(kRadius),
      child: Row(
        children: [
          Container(
            height: kHeight * 5,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(kRadius),
              border: isSelected
                  ? Border.all(color: const Color(0xFF6D130C))
                  : null,
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

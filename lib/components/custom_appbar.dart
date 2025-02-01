import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/utils/style/app_dimen.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  final bool showTrailing;
  final Widget? trailingWidget;
  const CustomAppBar({
    super.key,
    required this.title,
    this.showTrailing = true,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.1,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: kWidth * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.nanumGothic(
              color: Colors.white54,
              fontSize: 28.0.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          Visibility(
            visible: showTrailing,
            replacement: SizedBox(),
            child: trailingWidget ?? SizedBox(),
          )
        ],
      ),
    );
  }
}

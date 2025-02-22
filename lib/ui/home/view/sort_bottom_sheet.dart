import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/home_controller.dart';

class SortBottomSheet extends StatelessWidget {
  final HomeController controller;

  const SortBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Heading
          Text(
            "Sort By",
            style: GoogleFonts.nanumGothic(color: Colors.black,fontSize:22.sp,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 10),

          // Using ListView.builder
          Obx(() => ListView.builder(
            shrinkWrap: true, // Important for using inside a Column
            physics: NeverScrollableScrollPhysics(), // Prevents scrolling inside bottom sheet
            itemCount: controller.sortList.length,
            itemBuilder: (context, index) {
              final title = controller.sortList[index];
              // final isSelected = title == controller.selectedSort.value;

              return RadioListTile(
                title: Text(title.capitalizeFirst!,style: GoogleFonts.poppins( color: Colors.black87,
                  fontSize: 14.0,),),
                value: title,
                groupValue: controller.selectedSort.value,
                onChanged: (newValue) {
                  controller.updateSort(newValue!);
                },
              );
            },
          )),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:news_api/utils/style/app_dimen.dart';

import '../controller/home_controller.dart';
import '../widget/home_chip.dart';

class HomeHorizontalCategory extends StatelessWidget {
  const HomeHorizontalCategory({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: controller.chipList.length,
      itemBuilder: (context, index) {
        // 0 1 2 3 4 5 6
        final title = controller.chipList[index];
        final isSelected =
            controller.chipList[index] == controller.selectedChipText.value;
        return HomeCategoryChip(
          chipTitle: title,
          isSelected: isSelected,
          onTap: () {
            controller.updateSelectedChipListByIndex(index: index);
            // controller.updateSelectedChipListByName(selectedChip: title);
          },
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: kWidth * 2,
        );
      },
    );
  }
}

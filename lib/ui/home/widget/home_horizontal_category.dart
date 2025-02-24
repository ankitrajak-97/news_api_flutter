import 'package:flutter/material.dart';
import 'package:news_api/utils/style/app_dimen.dart';

import '../widget/home_chip.dart';

class HomeHorizontalCategory extends StatelessWidget {
  final List<String> chipList;
  final String currentSelectedChip;
  final ValueChanged<int> onSelectIndex;
  const HomeHorizontalCategory({
    super.key,
    required this.chipList,
    required this.currentSelectedChip,
    required this.onSelectIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: chipList.length,
      itemBuilder: (context, index) {
        // 0 1 2 3 4 5 6
        final title = chipList[index];
        // final isSelected = controller.chipList[index] == controller.selectedChipText.value;
        final isSelected = chipList[index] == currentSelectedChip;
        return HomeCategoryChip(
          chipTitle: title,
          isSelected: isSelected,
          // onTap: () {
          //   // controller.updateSelectedChipListByIndex(index: index);
          // },
          onTap: () {
            onSelectIndex(index);
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

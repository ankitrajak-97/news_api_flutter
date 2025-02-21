import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class SortBottomSheet extends StatelessWidget {
  final controller = Get.put(HomeController());

   SortBottomSheet({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Heading
          Text(
            "Sort By",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // List of sort options without Obx
          _buildSortOption("Newest First", "publishedAt"),
          _buildSortOption("Relevancy", "relevancy"),
          _buildSortOption("Popularity", "popularity")

        ],
      ),
    );
  }

  Widget _buildSortOption(String title, String value) {
    return Obx(() => RadioListTile(
      title: Text(title),
      value: value,
      groupValue: controller.selectedSort.value,
    onChanged: (newValue) {
      if (newValue != null) {
        controller.updateSortAndFetch(
            selectedSort: newValue); 
        Get.back();
      }
    }
    ));
  }
}

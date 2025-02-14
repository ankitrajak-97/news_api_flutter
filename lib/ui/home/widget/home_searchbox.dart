import 'package:flutter/material.dart';
import 'package:news_api/utils/style/app_dimen.dart';

import '../controller/home_controller.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHeight * 5,
      child: TextField(
        onChanged: (value) {
          controller.searchQuery.value = value;
        },
        onSubmitted: (value) {
          controller.fetchEverything(); // Fetch with new query
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search for news...',
          hintStyle: TextStyle(color: Colors.white70),
          prefixIcon: Icon(Icons.search, color: Colors.white54),
          filled: true,
          fillColor: Colors.white10,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadius * 3),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_api/utils/style/app_dimen.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onTextChanged;
  final ValueChanged<String> onTextSubmitted;

  const SearchBox({
    super.key,
    required this.onTextChanged,
    required this.onTextSubmitted,
    // required this.controller,
  });

  // final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHeight * 5,
      child: TextField(
        onChanged: (value) {
          // controller.searchQuery.value = value;
          onTextChanged(value);
        },
        onSubmitted: (value) {
          // controller.fetchEverything(); // Fetch with new query
          onTextSubmitted(value);
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

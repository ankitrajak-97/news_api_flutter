import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/newsmodel.dart';

class Newsapp extends StatefulWidget {
  const Newsapp({super.key});

  @override
  State<Newsapp> createState() => _NewsappState();
}

class _NewsappState extends State<Newsapp> {
  Future<NewsModel> fetchNews() async {
    const url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d637bc9ecd37446bbef7ae773e70e7da";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return NewsModel.fromJson(result);
    } else {
      throw Exception('Failed to fetch news');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ),
      body: FutureBuilder<NewsModel>(
        future: fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading spinner while waiting for data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show error message if fetching fails
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data!.articles != null) {
            final articles = snapshot.data!.articles!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  leading: article.urlToImage != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(article.urlToImage!),
                        )
                      : const CircleAvatar(
                          child: Icon(Icons.image_not_supported),
                        ),
                  title: Text(article.title ?? 'No Title'),
                  subtitle: Text(article.description ?? 'No Description'),
                );
              },
            );
          } else {
            // Handle the case where no articles are available
            return const Center(
              child: Text('No articles available'),
            );
          }
        },
      ),
    );
  }
}

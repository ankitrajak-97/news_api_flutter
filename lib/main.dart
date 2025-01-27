import 'package:flutter/material.dart';
import 'package:news_api/newsapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF37ecba),
        )
      ),
      debugShowCheckedModeBanner: false,
      home:const  Newsapp(),
    );
  }
}


  





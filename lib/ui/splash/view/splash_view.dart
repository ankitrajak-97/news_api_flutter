import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  // this name string should be unique. otherwise app may not work properly
  static const name = '/splash';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

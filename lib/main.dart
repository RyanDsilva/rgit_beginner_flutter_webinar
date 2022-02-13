import 'package:flutter/material.dart';
import 'package:rgit_flutter/screens/home.screen.dart';

void main() => runApp(const RGITFlutter());

class RGITFlutter extends StatelessWidget {
  const RGITFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RGIT',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

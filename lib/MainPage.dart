import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(child: Text('Bag'),bottom: 0,left: 5,)
        ],
      ),
    ));
  }
}

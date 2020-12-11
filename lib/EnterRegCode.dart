import 'package:flutter/material.dart';
class EnterRegCode extends StatefulWidget {
  @override
  _EnterRegCodeState createState() => _EnterRegCodeState();
}

class _EnterRegCodeState extends State<EnterRegCode> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Center(
            child: Text('test'),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parto_payment/RegisterPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        backgroundColor: Colors.black,
        fontFamily: 'Samim',


      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin{
  AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Center(
        child: Container(
          height: 250,
          child: Lottie.asset('assets/Parto.json',
          height: 245,
            controller: _animationController,
            onLoaded: (compo){
            _animationController
            ..duration=compo.duration
                ..forward().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),)));
            }

          )
        ),
      ),
    );
  }

}

import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:parto_payment/MainPage.dart';
//import 'package:flutter_otp_timer/flutter_otp_timer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:transition/transition.dart';

class EnterRegCode extends StatefulWidget {
  @override
  _EnterRegCodeState createState() => _EnterRegCodeState();
}

class _EnterRegCodeState extends State<EnterRegCode> {
  bool showSubmitBtn=false;

  CountDownController _countDownCtrl=CountDownController();

  TextEditingController _picCodeFieldCtrl=new TextEditingController();
  StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    errorController=StreamController<ErrorAnimationType>();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child:          Container(
            height: 350,
            width: 350,
            alignment: Alignment.center,
              child:
                Column(
                 // alignment: Alignment.center,
                  children: [
                    CircularCountDownTimer(
                      controller: _countDownCtrl,
                      duration: 15,
                      height: 150,
                      width: 150,
                      color: Colors.deepOrange,
                      fillColor: Colors.black,
                      isTimerTextShown: true,
                      strokeWidth: 6,
                      isReverse: true,
                      textStyle: TextStyle(color: Colors.deepOrange,fontSize: 45),
                      onComplete: (){
                        setState(() {
                          showSubmitBtn=true;
                        });
                      },


                    ),
                    PinCodeTextField(appContext: context, length: 4,
                    keyboardType: TextInputType.number,
                      mainAxisAlignment: MainAxisAlignment.center,
                      animationDuration: Duration(milliseconds:300),
                      backgroundColor: Colors.black,
                      enableActiveFill: true,
                      controller: _picCodeFieldCtrl,
                      errorAnimationController: errorController,
                      errorAnimationDuration: 300,





                      //autoDismissKeyboard: true,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        fieldWidth: 60,
                        selectedFillColor: Colors.orange,
                        activeColor: Colors.deepOrange,
                        activeFillColor: Colors.deepOrange,
                        inactiveFillColor: Colors.deepOrange,
                        inactiveColor: Colors.deepOrange,
                        selectedColor: Colors.deepOrange

                      ),
                      onCompleted: (v){
                      if(_picCodeFieldCtrl.text=='1234')
                        Navigator.push(context, Transition(child:MainPage(),transitionEffect: TransitionEffect.fade).builder());
                      else
                        errorController.add(ErrorAnimationType.shake);


                      },

                    ),
                    Text('کد دریافتی را وارد کنید',style: TextStyle(color: Colors.deepOrange),),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    showSubmitBtn?
                    GFButton(
                        color: Colors.deepOrange,
                        child: Text('ارسال مجدد کد',style: TextStyle(color: Colors.black,fontFamily: 'Samim',fontWeight: FontWeight.w900),),
                        shape: GFButtonShape.pills,
                        size: GFSize.LARGE,
                        fullWidthButton: true,
                        //padding: EdgeInsets.all(25),


                        onPressed: (){
                          setState(() {
                            showSubmitBtn=false;
                          });
                         _countDownCtrl.restart();


                        }):
                    Container(height: 0,)

                  ],
                )

          ),

        ),
        ));
  }
}

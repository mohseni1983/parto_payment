import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:parto_payment/EnterRegCode.dart';
import 'package:transition/transition.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool showSubmitBtn=false;
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child:
    Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 350,
          width: 280,
          alignment: Alignment.center,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.deepOrange,
                radius: 77,
                child:
                CircleAvatar(

                    radius: 75,
                    child:SvgPicture.asset('assets/svg/mobile-phone.svg',color: Colors.deepOrange,height: 75,) ),

              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.deepOrange,style: BorderStyle.solid,width: 2),
                    gapPadding: 2,


                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.deepOrange.shade600,style: BorderStyle.solid,width: 2),
                    gapPadding: 2,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.deepOrange,style: BorderStyle.solid,width: 2),
                    gapPadding: 2,


                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.deepOrange,style: BorderStyle.solid,width: 2),
                    gapPadding: 2,



                  ),
                  prefixIcon: Icon(Icons.phone_android_rounded,color: Colors.deepOrange,),
                  hintText: '09XXXXXXXXX',
                  counterText: ''


                ),
                 maxLength: 11,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                onChanged: (v){
                  if(v.length==11){
                    setState(() {
                      showSubmitBtn=true;
                    });
                  }else{
                    setState(() {
                      showSubmitBtn=false;
                    });
                  }
                },

              ),
              Padding(padding: EdgeInsets.only(top: 3)),
              showSubmitBtn?
              GFButton(
                  color: Colors.deepOrange,
                  child: Text('ارسال کد',style: TextStyle(color: Colors.black,fontFamily: 'Samim',fontWeight: FontWeight.w900),),
                  shape: GFButtonShape.pills,
                  size: GFSize.LARGE,
                  fullWidthButton: true,
                  //padding: EdgeInsets.all(25),


                  onPressed: (){
                    Navigator.push(
                      context,
                      Transition(
                          child: EnterRegCode(),
                          transitionEffect: TransitionEffect.scale)
                          .builder(),
                    );

                  }):
                  Container(height: 0,)
            ],
          ),

        ),
      ),
    )
    );
  }
}

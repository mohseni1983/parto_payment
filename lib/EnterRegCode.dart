import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';

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
            child:          Container(
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
                    child: Text('ارسال کد',style: TextStyle(color: Colors.black),),
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
        ));
  }
}

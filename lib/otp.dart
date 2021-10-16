import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:google_fonts/google_fonts.dart';

class OTP extends StatefulWidget {
  final String currentNumber;
  OTP({this.currentNumber});
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String buttonText = 'Verify';
  String otp= '1234';  bool haserror = false;
  Color buttontext = Colors.black;
  Color buttoncolor = Color(0xFFA1A1A1);
  var currentText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 90,
                ),
                Text(
                  'Verify OTP',
                  style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 7,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Enter the code sent to ",
                        style: GoogleFonts.rubik(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      TextSpan(
                        text: widget.currentNumber,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.number,
                    autoDismissKeyboard: true,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 300),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      inactiveColor: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 48,
                      activeFillColor: Colors.lightGreen,
                    ),
                    onChanged: (value) {
                      setState(() {
                        currentText = value;
                        print(currentText);
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    haserror
                        ? Text(
                            'OTP doesn’t matched!',
                            style: GoogleFonts.rubik(
                                color: Color(0xFF565656),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        : Container(width: 152,),
                    Text(
                      'Resend OTP (05:00)',
                      style: GoogleFonts.rubik(
                          color:haserror? Colors.orange: Color(0xFF565656),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                SizedBox(
                  height: 224,
                ),
                FlatButton(
                  onPressed: () {
                    if(currentText==otp){
                      setState(() {
                        haserror=false;
                      });
                    }else{
                  setState(() {
                    haserror=true;
                  });
                    }print(haserror);
                    setState(() {
                      buttonText = haserror? 'Not verified':'Logging In...';
                      buttoncolor = Color(0xFF034464);
                      buttontext = Colors.white;
                    });
                  },
                  child: Center(
                      child: Text(
                    buttonText,
                    style: GoogleFonts.rubik(
                        color: buttontext,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  )),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 61,
                  color: buttoncolor,
                  minWidth: 350,
                ),
                SizedBox(
                  height: 24,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'By continuing, you agree to our ',
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: 'Terms & Conditions ',
                      style: TextStyle(color: Colors.pinkAccent)),
                  TextSpan(text: 'and ', style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Colors.pinkAccent)),
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

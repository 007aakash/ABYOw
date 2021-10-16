import 'package:abyow/otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({Key key}) : super(key: key);

  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  String phonenumber;
  @override
  Widget build(BuildContext context) {
    String buttonText = 'Send OTP';
    Color buttontext = Colors.white;
    Color buttoncolor = Color(0xFF034464);
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
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 18,
                      color: Colors.black,
                    )
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Enter your mobile number',
                  style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 48,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage('assets/Group.png'),
                        height: 28,
                        width: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('-',
                          style: GoogleFonts.rubik(
                              color: Colors.grey, fontSize: 18)),
                      SizedBox(
                        width: 8,
                      ),
                      Text('+91',
                          style: GoogleFonts.rubik(
                              color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 29,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Container(
                              width: 190,
                              height: 18,
                              child: TextField(showCursor: false,
                                onChanged: (value){
                                phonenumber= value;
                                },
                                style: GoogleFonts.rubik(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintText: '(xxx)xxx-xxxx',
                                  hintStyle: GoogleFonts.rubik(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              height: 0.6,
                              width: 180,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 320,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OTP(currentNumber: phonenumber,)));
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

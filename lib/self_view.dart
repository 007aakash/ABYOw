import 'package:abyow/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class SelfView extends StatelessWidget {
  const SelfView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 14,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 24,),
                 Image.asset('aseets/back.png'),
                    Text('My Profile',style: GoogleFonts.poppins(color: Color(0xFF034464),fontSize: 24),),
                    Image.asset('assets/edit.png'),
                  ],
                ),
                SizedBox(height: 36,),
                Container(height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Color(0xFF034464),width: 2),
                  ),
                  child: Image.network('https://images.unsplash.com/photo-1459356979461-dae1b8dcb702?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Ym95fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',),
                ),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 1,
                    ),
                    Text(
                      'Wade Warren',
                      style: GoogleFonts.rubik(fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '24',
                      style: GoogleFonts.rubik(
                          color: Color(0xFFAC72B1),
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/suitcase.png'),
                    Text(
                      'Engineer',
                      style: GoogleFonts.rubik(
                          color: Color(0xFFAC72B1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/height.png'),
                    Text(
                      '5’23’’',
                      style: GoogleFonts.rubik(
                          color: Color(0xFFAC72B1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 60,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

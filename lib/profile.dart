import 'package:abyow/self_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

//change the color here to reflect it to whole ui
Color fontcolor= Color(0xFFAC72B1);
Color bordercolor= Color(0xFF034464);
//this includes the font color and the border color for containers

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentindex = 0;
  int _current = 0;
  bool selected=false;
  String text1='Add crush';
  String text2= 'Remove crush';

  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1551022372-0bdac482b9d6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Ym95c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1513956589380-bad6acb9b9d4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJveXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1554126807-6b10f6f6692a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Ym95fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1507438222021-237ff73669b5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGJveXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1482849737880-498de71dda8d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGJveXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(item, fit: BoxFit.cover, width: 1000.0),
                ),
              ),
            ))
        .toList();
    return Container(
      height: size.height,
      width: size.width,
      child: Container(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              SizedBox(height: 24),
              Stack(
                children: [
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        aspectRatio: 0.9,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Positioned(
                    top: 10,
                    left: 20,
                    child: Container(width: size.width-60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(child: Image.asset('assets/back.png'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> SelfView()));},),
                          Image.asset('assets/star.png'),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.black
                                        : Colors.white)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 1,
                  ),
                  Text(
                    'Wade Warren',
                    style: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w700),
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
                        color: fontcolor,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/suitcase.png'),
                  Text(
                    'Engineer',
                    style: GoogleFonts.rubik(
                        color: fontcolor,
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
                        color: fontcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 60,),
                ],
              ),
              SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.all(1.0),
               child: CustomPaint(
                 foregroundPainter: CustomFadingEffectPainer(),
                 child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.',
                   style: GoogleFonts.rubik(fontSize: 16,color: Color(0xFF034464),fontWeight: FontWeight.w300),),
               ),
             ),
              GestureDetector(
                onTap: (){
                  selected=!selected;
                  print(selected);
                },
                child: Container(
                  height: 60,
                  width: 392,
                  decoration: BoxDecoration(
                    color: !selected ? Colors.white : Color(0xFF034464),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: bordercolor,width: 2),
                  ),
                  child: Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 50,),
                      Image.asset(!selected ? 'assets/crush.png' : 'assets/Vector.png'),
                      Text(!selected ? text1: text2, style: !selected ? GoogleFonts.poppins(fontSize: 17,color: Color(0xFF034464)) : GoogleFonts.poppins(fontSize: 17,color: Colors.white),),
                        SizedBox(width: 50,),
                    ],),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class CustomFadingEffectPainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    Paint paint = Paint()..shader = LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(0, 255, 255, 255)
        ]).createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomFadingEffectPainer linePainter) => false;
}

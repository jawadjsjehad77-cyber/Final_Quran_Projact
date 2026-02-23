import 'dart:math' as math;
import 'package:final_project/Pages/grades.dart';
import 'package:final_project/Pages/group.dart';
import 'package:final_project/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Pages/Quran.dart';
import 'package:final_project/Pages/home.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:signed_spacing_flex/signed_spacing_flex.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var Ycolor = new  Color(0xFFE5D8C1);
    var Bcolor = new Color(0xFFA9CCE3);

    var user = Supabase.instance.client.auth.currentUser;

    return Scaffold(
      extendBody: true,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Bcolor, Ycolor],
          ),
        ),
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Text("حَلَقَاتُ النُّورِ لِتَحْفِيظِ القُرْآنِ",style: GoogleFonts.amiri(
                fontSize: 39,
                fontWeight: FontWeight.w200,
                color: Color.fromARGB(255, 70, 112, 140),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0 ,bottom: 70),
              child: SizedBox(
                width: screenWidth * 1,
                height: screenHeight * 0.38,
                child: Transform.rotate(
                  angle: 7.3*(math.pi/180),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15 , right: 8 , top: 8 , bottom: 8 ),
                    child: Image.asset('assets/images/HomePagePhoto1.png' , ),
                  )
                ) ,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                              Ycolor,
                              Bcolor,
                            ],
                        ),
                    ),
                    child: InkWell(
                  onTap: () => Colors.transparent,
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Quran(),)
                                  );
                                }, 
                                  icon: FaIcon(
                                    FontAwesomeIcons.quran,
                                    size: 60,
                                    color: Colors.white54,
                                  ),) 
                            ),
                                Text('المصحف',style: TextStyle(
                                  color: const Color.fromARGB(211, 114, 94, 94),
                                  fontSize: 17,
                                ))
                          ],
                        ),
                      ),
                    ),
                   ),
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Ycolor,
                            Bcolor,
                            ],
                        ),
                    ),
                     child: InkWell(
                  onTap: () => Colors.transparent,
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.only( right: 13),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Center(
                            child: Stack(
                                  children: [
                                    Padding(padding: const EdgeInsets.only(bottom: 20,left: 16),
                                    child: Icon(Icons.trending_up,
                                    color: Colors.white54,
                                    size: 60,)
                                    ), 
                                      Transform.flip(
                                        flipX: true,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 22,right: 4),
                                        child: IconButton(onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => grades(),));
                                        }, icon: Icon(Icons.bar_chart_rounded ,
                                        color: Colors.white54,
                                        size: 60,),)
                                      )),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 14 , top: 81),
                                        child: Text("التقييمات" , style: TextStyle(
                                          fontSize: 17,
                                          color: Color.fromARGB(211, 114, 94, 94)
                                        )),
                                      )
                                 ],
                            ),
                          ),
                        ],)
                      ),
                    ),
                ),
                   ),
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Ycolor,
                            Bcolor,
                            ],
                        ),
                    ),
                     child: InkWell(
                  onTap: () => Colors.transparent,
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
                    child: Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: IconButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Group(),));
                              }, icon: Icon( Icons.groups ,
                                size: 70,
                                color: Colors.white54),) 
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 75 , left: 18),
                              child: Text("الحلقات" , style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(211, 114, 94, 94)
                              )),
                            )
                        ],) 
                      ),
                ),
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(0.0),
              selectedItemColor: Color(0xFF455A64),
              currentIndex: current, 
        onTap: (index) {
          setState(() {
            current = index; 
            
            if(index == 1){

            }
            else if(index == 3){

            }
          });
        },
        items: [
          
          BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined ),
          label: 'الرئيسية', 
          activeIcon: Icon(Icons.home),
          ),

          BottomNavigationBarItem(
          label: 'الملف الشخصي', 
          activeIcon: Icon(Icons.person),
          
          icon: PopupMenuButton<String>(
            elevation: 12,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.brown[100],
            icon: Icon(Icons.person_outline),
            offset: Offset(-85 ,-110),
            
            onSelected: (value){
              if(value == "2"){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => LoginScreen()));
              };
            },
            itemBuilder: (context)=> [
              PopupMenuItem(value: "1",child: Text(" ${user?.userMetadata?['name']} مرحبا",  style: GoogleFonts.amiri( color: Colors.black54, fontSize: 17 ))),
              PopupMenuItem(value: "2",child: Text("تسجيل خروج" , style: GoogleFonts.amiri( color: Colors.black54, fontSize: 17 ))),
            ]),
          ),

          BottomNavigationBarItem(
          label: 'الإعدادات',
          activeIcon: Icon(Icons.settings),

          icon: PopupMenuButton<String>(
            elevation: 12,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.brown[100],
            icon: Icon(Icons.settings_outlined),
            offset: Offset(-20, -150),
            
            onSelected: (value){

              if(value == "1"){
              }
              if(value == "2"){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Group()),
                  );
              }
              if(value == "3"){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Quran()));
              };
            },
            itemBuilder: (context)=> [
              PopupMenuItem(value: "1",child: Text("الرئيسية" , style: GoogleFonts.amiri( color: Colors.black54, fontSize: 17 ))),
              PopupMenuItem(value: "2",child: Text("الحلقات" , style: GoogleFonts.amiri( color: Colors.black54, fontSize: 17 ))),
              PopupMenuItem(value: "3",child: Text("المصحف" , style: GoogleFonts.amiri( color: Colors.black54, fontSize: 17 ))),
            ]),
           )
      ],),
    );
  }
}
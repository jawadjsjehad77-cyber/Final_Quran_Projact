import 'package:flutter/material.dart';
import 'package:final_project/Pages/home.dart';
import 'package:final_project/Pages/Group.dart';
import 'package:final_project/service/api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/pages/login_screen.dart';
import 'package:final_project/model.dart/ApiQuran.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    
    var user = Supabase.instance.client.auth.currentUser;
    
    int current = 0;

    return  Scaffold(
      body: FutureBuilder(
        future: Api().getData(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child:LoadingAnimationWidget.halfTriangleDot(color: Colors.black54, size: 50),);
    }
    if (snapshot.connectionState == ConnectionState.done){
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.center,
            end: AlignmentGeometry.bottomRight,
            colors:[Color(0xFFA9CCE3), Color(0xFFE5D8C1)],
          ),
        ),
        child: ListView(children: [
          for (var surah in snapshot.data!)
            Center(
              child: ListTile( 
                tileColor: Color.fromARGB(255, 255, 255, 255),
                title: Directionality(textDirection: TextDirection.rtl, child: Text(surah.surahs_name ?? "" , )) ,           
                trailing: const Icon(Icons.chevron_left),       
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => QuranDetails(surah: surah))
                  );
                },
              ),
            ),
        ],),
      );
    }
    return const Center(child: Text("Error 404"));
        },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:Color(0xFFE5D8C1),
        onTap: (index) {
          setState(() {
            current = index; 
            if(index == 0 ){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
            }
            if(index == 1 ){
            }
            if(index == 2 ){
            }
          });
        },
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'الرئيسية', 
          activeIcon: Icon(Icons.home)),

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
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Home()),
                  );
              }
              if(value == "2"){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Group()),
                  );
              }
              
              if(value == "3"){

              }
            },
            itemBuilder: (context)=> [
              PopupMenuItem(value: "1",child: Text("الرئيسية" , style: GoogleFonts.amiri( color: Colors.black54, fontSize: 17 ))),
              PopupMenuItem(value: "2",child: Text("الحلقات" , style: GoogleFonts.amiri( color: Colors.black54, fontSize: 17 ))),
              PopupMenuItem(value: "3",child: Text("المصحف" , style: GoogleFonts.amiri( color: Colors.black54, fontSize: 17 ))),
            ]),
           )
      ],) 
    );
  }
}

class QuranDetails extends StatelessWidget {
  final ApiQuran surah;
  const QuranDetails({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(116, 169, 204, 227),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 58),
        child: Text(surah.surahs_name ?? "" , style: TextStyle(fontWeight: FontWeight.w600),),
        
      ))),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.center,
              colors: [Color.fromARGB(116, 169, 204, 227), Color.fromARGB(123, 229, 216, 193)]
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              Center(
                child: Text(
                  surah.ayahs ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22, height: 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
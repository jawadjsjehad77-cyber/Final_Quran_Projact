import 'package:final_project/Pages/Quran.dart';
import 'package:final_project/Pages/group.dart';
import 'package:final_project/Pages/home.dart';
import 'package:final_project/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class grades extends StatefulWidget {
  const grades({super.key});

  @override
  State<grades> createState() => _gradesState();
}

class _gradesState extends State<grades> {
  @override
  Widget build(BuildContext context) {

    var user = Supabase.instance.client.auth.currentUser;
    int current = 0;

    final List<Map<String, String>> studentGrades = [
      {"name": "جواد جهاد", "grade": "95%", "status": "ممتاز"},
      {"name": "أحمد علي", "grade": "88%", "status": "جيد جداً"},
      {"name": "سلطان عبدالله", "grade": "75%", "status": "جيد"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("تقييمات الطلاب", style: GoogleFonts.amiri()),
        centerTitle: true,
        backgroundColor:  Color(0xFFA9CCE3),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.bottomLeft,
            end: AlignmentGeometry.topRight,
            colors: [Color(0xFFE5D8C1) , Color(0xFFA9CCE3)]
          )
        ),
        child: ListView.builder(
          itemCount: studentGrades.length,
          itemBuilder: (context, index) {
            return Card(
              margin:  EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // AI
                leading: CircleAvatar(
                backgroundColor: const Color(0xFF455A64),
                child: Text(
                  studentGrades[index]["grade"]!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
        
                title: Text(
                  studentGrades[index]["name"]!,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.amiri(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                
                subtitle: Text(
                  studentGrades[index]["status"]!,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.green[700]),
                ),
                trailing: const Icon(Icons.star, color: Colors.amber),
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xFFE5D8C1),
        onTap: (index) {
          setState(() {
            current = index; 
            
            if(index == 0){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Home(),));
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
      ],) 
    );
  }
}
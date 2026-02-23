import 'package:final_project/Pages/Quran.dart';
import 'package:final_project/Pages/home.dart';
import 'package:final_project/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    
    int current = 0;
    
    var Ycolor = new  Color(0xFFE5D8C1);
    var Bcolor = new Color(0xFFA9CCE3);

    var user = Supabase.instance.client.auth.currentUser;

    List<String> groups = ["حلقة الإمام عاصم", "حلقة الإمام نافع", "حلقة الإمام أحمد"];

    return Scaffold(
      appBar: AppBar(
        // animateColor: bool.fromEnvironment(AutofillHints.addressState),
        title: Text("الحلقات" , style: GoogleFonts.amiri()),
        centerTitle: true,
        backgroundColor: Color(0xFFA9CCE3),
      ),
      body: Container(
        
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Bcolor, Ycolor],
          ),
          ),
          child: ListView.builder(
            itemCount: groups.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: ListTile(
                  title: Text(groups[index], textAlign: TextAlign.right ,style: GoogleFonts.amiri()),
                  leading: const Icon(Icons.groups, color: Color(0xFF455A64)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                  },
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Ycolor,
              currentIndex: current, 
        onTap: (index) {
          setState(() {
            current = index; 
            
            if(index == 0){
              Navigator.push(context, MaterialPageRoute(builder:  (context) => Home(),));
            }

            else if(index == 1){
              
            }
            else if(index == 2){
              print("hello world");
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
          // icon: Icon(Icons.person_outline),
          label: 'الملف الشخصي', 
          activeIcon: Icon(Icons.person),
          
          icon: PopupMenuButton<String>(
            elevation: 12,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.brown[100],
            icon: Icon(Icons.person_outline),
            offset: Offset(-85 ,-110),
            
            onSelected: (value){
              if(value == "4"){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => LoginScreen()));
              };
            },
            itemBuilder: (context)=> [
              PopupMenuItem(value: "1",child: Text(" ${user?.userMetadata?['name']} مرحبا",  style: GoogleFonts.amiri( color: Colors.black54, fontSize: 17 ))),
              PopupMenuItem(value: "4",child: Text("تسجيل خروج" , style: GoogleFonts.amiri( color: Colors.black54, fontSize: 17 ))),
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
                print("تراك بهذي الصفحة يالغالي");
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
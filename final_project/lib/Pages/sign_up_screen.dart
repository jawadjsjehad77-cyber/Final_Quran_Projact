import 'package:final_project/Pages/Home.dart';
import 'package:final_project/extension/navigator.dart';
import 'package:final_project/pages/login_screen.dart';
import 'package:final_project/service/database.dart';
import 'package:final_project/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var namecontroller = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topRight,
            end: AlignmentGeometry.bottomLeft,
            colors: [Color(0xFFA9CCE3) , Color(0xFFADC2A9)]
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Center( 
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              height: height * 0.5,
              
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topLeft,
                  end: AlignmentGeometry.bottomRight,
                  colors: [Color.fromARGB(255, 218, 246, 212) , Color.fromARGB(255, 248, 237, 217)]
                ),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "تسجيل مستخدم جديد",
                    style: GoogleFonts.amiri(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextFieldWidget(
                    hint: "الايميل",
                    icon: Icon(Icons.email),
                    controller: emailController,
                  ),
                  TextFieldWidget(
                    hint: "كلمة المرور",
                    icon: Icon(Icons.password),
                    controller: passwordController,
                    isObscure: true,
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      await Database().signUp(
                        email: emailController.text,
                        password: passwordController.text, 
                        name: namecontroller.text,
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                    },
                    child: Text("تأكيد" , style: GoogleFonts.amiri()),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushAndDelete(LoginScreen());
                    },
                    child: Text("لديك حساب بالفعل؟" , style: GoogleFonts.amiri(),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


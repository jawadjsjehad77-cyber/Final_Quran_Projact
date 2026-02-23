import 'package:final_project/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Pages/home.dart';
import 'package:final_project/service/database.dart';
import 'package:final_project/extension/navigator.dart';
import 'package:final_project/Pages/sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    
    var Ycolor = new  Color(0xFFE5D8C1);
    var Bcolor = new Color(0xFFA9CCE3);

    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.centerLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [Bcolor , Ycolor]
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
                begin: AlignmentGeometry.centerLeft,
                end: AlignmentGeometry.centerRight,
                colors: [Ycolor , Bcolor]
              ),
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10,)],
              borderRadius: BorderRadius.circular(20),
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "تسجيل الدخول",
                    style: GoogleFonts.amiri(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextFieldWidget(
                    hint: "أدخل البريد الإلكتروني",
                    icon: Icon(Icons.email),
                    controller: emailController,
                  ),
                  TextFieldWidget(
                    hint: "أدخل كلمة المرور",
                    icon: Icon(Icons.password),
                    controller: passwordController,
                    isObscure: true,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await Database().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        if (context.mounted) {
                          context.push(Home());
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
                    },
                    child: Text("دخول", style: GoogleFonts.amiri(fontSize: 18)),
                  ),
                  TextButton(
                    onPressed: () async {
                      context.pushAndDelete(SignupScreen());
                    },
                    child: Text("لا تملك حساب؟ سجل الآن", style: GoogleFonts.amiri(fontSize: 18)),
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
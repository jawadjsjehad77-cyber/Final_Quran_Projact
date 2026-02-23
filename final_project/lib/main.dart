import 'package:final_project/Pages/home.dart';
import 'package:final_project/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://lbojzkhmycoicgofivdx.supabase.co",
    anonKey: "sb_publishable_VvupIuDE16Cor9QITSWSaA_YmXhFDBu",
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quran',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

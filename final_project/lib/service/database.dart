// import 'package:day9_database_auth_man/models/course.dart';
import 'package:final_project/model.dart/ApiQuran.dart';
import 'package:final_project/model.dart/Grades.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;

  signUp({required String email, required String password, required String name}) async {
    await supabase.auth.signUp(email: email, password: password, data: {"name": name});
  }

  login({required String email, required String password}) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

addGrades({required String title, required String image, required String message}) async {
  try {
    await supabase.from("rates").insert({
      "title": title, 
      "image": image, 
      "message": message
    });
  } catch (e) {
    print("Error inserting data: $e");
  }
}
  Future<List<Grades>> getGrades() async {
    var response = await supabase.from("rates").select().order('id', ascending: false);
    List<Grades> ratesList = [];
    for (var item in response) {
      Grades rate = Grades();
      rate.title = item['title'];
      rate.message = item['message']; 
      ratesList.add(rate);
    }
    return ratesList;
  }
}
import 'dart:convert';
import 'package:final_project/model.dart/ApiQuran.dart';
import 'package:http/http.dart' as http;

class Api {
  String link = "http://api.alquran.cloud/v1/quran/quran-uthmani";
  Future<List<ApiQuran>>getData() async{
    var uri = Uri.parse(link);
    var response = await http.get(uri);
    var result = jsonDecode(response.body);
    
    List<ApiQuran> SurahsList = [];

    for(var item in result["data"]["surahs"]){
      ApiQuran p1 = ApiQuran.fromJson(item);
      SurahsList.add(p1);
      
    }
    return SurahsList;
  }
}
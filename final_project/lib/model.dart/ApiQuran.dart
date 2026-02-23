class ApiQuran {
  String? surahs_name;
  String? ayahs;
  int? number_of_surah;

  ApiQuran({this.ayahs , this.surahs_name , this.number_of_surah});

  factory ApiQuran.fromJson(Map<String, dynamic> json) {
    
  var ayahsTemp = json; 
  String allayahs = "";

  for(int i = 0 ; i < ayahsTemp["ayahs"].length; i++ ){
    
    String singleayah = ayahsTemp["ayahs"][i]["text"];

    if(i == 0){
      singleayah = singleayah.replaceAll("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ ", " ");
    }
      int number_of_ayahs = ayahsTemp["ayahs"][i]["numberInSurah"];
      allayahs += "$singleayah ($number_of_ayahs) ";
  }

  return ApiQuran(
    surahs_name: ayahsTemp["name"],
    number_of_surah: ayahsTemp["number"],
    ayahs: allayahs,
  );
}
}
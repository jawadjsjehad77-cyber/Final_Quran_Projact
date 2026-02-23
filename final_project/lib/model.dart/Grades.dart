class Grades {
  String? title;
  String? message;

  Grades({this.title, this.message});

  Grades.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'message': message,
    };
  }
}
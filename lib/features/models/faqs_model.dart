
class FaqsModel {
  int? id;
  late String question;late String answer;

  FaqsModel({this.id, required this.question, required this.answer});

  FaqsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}
//from postMan-->json to dart

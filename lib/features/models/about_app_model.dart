

class AboutAppModel {
  late final Data data;
  late final String status;
  late final String message;

  AboutAppModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }

}

class Data {
  late final String about;

  Data.fromJson(Map<String, dynamic> json){
    about = json['about'];
  }

}
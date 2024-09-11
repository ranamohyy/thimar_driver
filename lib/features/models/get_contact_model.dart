
class ContactUsModel {
  Data data;
  String status;
  String message;

  ContactUsModel({
    required this.data,
    required this.status,
    required this.message,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
    data: Data.fromJson(json["data"]),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "status": status,
    "message": message,
  };
}

class Data {
  String? phone;
  String email;
  String ?whatsapp;
  Social ?social;
  double lat;
  double lng;
  String location;

  Data({
     this.phone,
    required this.email,
     this.whatsapp,
     this.social,
    required this.lat,
    required this.lng,
    required this.location,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    phone: json["phone"]??"",
    email: json["email"],
    whatsapp: json["whatsapp"]??'',
    social: Social.fromJson(json["social"]??{}),
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "email": email,
    "whatsapp": whatsapp,
    "social": social?.toJson()??'',
    "lat": lat,
    "lng": lng,
    "location": location,
  };
}

class Social {
  String ?facebook;
  String ?twitter;
  String ?instagram;

  Social({

     this.facebook,
     this.twitter,
     this.instagram,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    facebook: json["facebook"]??'',
    twitter: json["twitter"]??'',
    instagram: json["instagram"]??'',
  );

  Map<String, dynamic> toJson() => {
    "facebook": facebook,
    "twitter": twitter,
    "instagram": instagram,
  };
}

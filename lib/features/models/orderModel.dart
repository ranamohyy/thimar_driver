class OrderModel {
  int id;
  String status;
  DateTime date;
  String time;
  num orderPrice;
  num deliveryPrice;
  num totalPrice;
  String phone;
  Address address;
  String payType;
  String note;
  String clientName;
  String clientImage;
  dynamic city;
  List<Image> images;

  OrderModel({
    required this.id,
    required this.status,
    required this.date,
    required this.time,
    required this.orderPrice,
    required this.deliveryPrice,
    required this.totalPrice,
    required this.phone,
    required this.address,
    required this.payType,
    required this.note,
    required this.clientName,
    required this.clientImage,
    required this.city,
    required this.images,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    status: json["status"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    orderPrice: json["order_price"]?.toDouble(),
    deliveryPrice: json["delivery_price"],
    totalPrice: json["total_price"]?.toDouble(),
    phone: json["phone"],
    address: Address.fromJson(json["address"]),
    payType: json["pay_type"],
    note: json["note"]??"",
    clientName: json["client_name"],
    clientImage: json["client_image"],
    city: json["city"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
    "order_price": orderPrice,
    "delivery_price": deliveryPrice,
    "total_price": totalPrice,
    "phone": phone,
    "address": address.toJson(),
    "pay_type": payType,
    "note": note,
    "client_name": clientName,
    "client_image": clientImage,
    "city": city,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Address {
  int id;
  String type;
  double lat;
  double lng;
  String location;
  String description;
  int userId;
  int isDefault;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  Address({
    required this.id,
    required this.type,
    required this.lat,
    required this.lng,
    required this.location,
    required this.description,
    required this.userId,
    required this.isDefault,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    type: json["type"],
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    location: json["location"],
    description: json["description"],
    userId: json["user_id"],
    isDefault: json["is_default"],
    phone: json["phone"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "lat": lat,
    "lng": lng,
    "location": location,
    "description": description,
    "user_id": userId,
    "is_default": isDefault,
    "phone": phone,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Image {
  String name;
  String url;

  Image({
    required this.name,
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

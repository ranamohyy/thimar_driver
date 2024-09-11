class PrivacyModel {
  Data data;
  String status;
  String message;

  PrivacyModel({
    required this.data,
    required this.status,
    required this.message,
  });

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
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
  String policy;

  Data({
    required this.policy,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    policy: json["policy"],
  );

  Map<String, dynamic> toJson() => {
    "policy": policy,
  };
}

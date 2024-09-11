class NotificationsModel {
  Data data;
  String status;
  String message;

  NotificationsModel({
    required this.data,
    required this.status,
    required this.message,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
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
  int unreadnotificationsCount;
  List<Notification> notifications;

  Data({
    required this.unreadnotificationsCount,
    required this.notifications,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    unreadnotificationsCount: json["unreadnotifications_count"],
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "unreadnotifications_count": unreadnotificationsCount,
    "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
  };
}

class Notification {
  String id;
  String title;
  String body;
  String notifyType;
  Order order;
  dynamic offer;
  dynamic chat;
  String createdAt;
  String readAt;
  String image;

  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.notifyType,
    required this.order,
    required this.offer,
    required this.chat,
    required this.createdAt,
    required this.readAt,
    required this.image,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    notifyType: json["notify_type"],
    order: Order.fromJson(json["order"]),
    offer: json["offer"],
    chat: json["chat"],
    createdAt: json["created_at"],
    readAt: json["read_at"]??'',
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "notify_type": notifyType,
    "order": order.toJson(),
    "offer": offer,
    "chat": chat,
    "created_at": createdAt,
    "read_at": readAt,
    "image": image,
  };
}

class Order {
  int orderId;
  int clientId;
  int? driverId;
  dynamic orderType;
  String orderStatus;

  Order({
    required this.orderId,
    required this.clientId,
    required this.driverId,
    required this.orderType,
    required this.orderStatus,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    clientId: json["client_id"],
    driverId: json["driver_id"],
    orderType: json["order_type"],
    orderStatus: json["order_status"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "client_id": clientId,
    "driver_id": driverId,
    "order_type": orderType,
    "order_status": orderStatus,
  };
}




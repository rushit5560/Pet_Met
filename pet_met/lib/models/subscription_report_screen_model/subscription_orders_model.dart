import 'dart:convert';

SubscriptionOrdersModel subscriptionOrdersModelFromJson(String str) => SubscriptionOrdersModel.fromJson(json.decode(str));

String subscriptionOrdersModelToJson(SubscriptionOrdersModel data) => json.encode(data.toJson());

class SubscriptionOrdersModel {
  SubscriptionOrdersModel({
    required this.success,
    required this.date,
    required this.message,
  });

  bool success;
  Date date;
  String message;

  factory SubscriptionOrdersModel.fromJson(Map<String, dynamic> json) => SubscriptionOrdersModel(
    success: json["success"] ?? false,
    date: Date.fromJson(json["date"] ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "date": date.toJson(),
    "message": message,
  };
}

class Date {
  Date({
    required this.order,
    required this.orderdetails,
  });

  Order order;
  List<SubscriptionOrders> orderdetails;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    order: Order.fromJson(json["order"] ?? {}),
    orderdetails: List<SubscriptionOrders>.from(json["orderdetails"].map((x) => SubscriptionOrders.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "order": order.toJson(),
    "orderdetails": List<dynamic>.from(orderdetails.map((x) => x.toJson())),
  };
}

class Order {
  Order({
    required this.id,
    required this.userid,
    required this.categoryId,
    required this.planid,
    required this.price,
    // required this.startdate,
    // required this.endadate,
    // required this.createdDate,
  });

  String id;
  String userid;
  String categoryId;
  String planid;
  String price;
  // DateTime startdate;
  // DateTime endadate;
  // DateTime createdDate;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"] ?? "",
    userid: json["userid"] ?? "",
    categoryId: json["categoryID"] ?? "",
    planid: json["planid"] ?? "",
    price: json["price"] ?? "",
    // startdate: DateTime.parse(json["startdate"] ?? DateTime.now()),
    // endadate: DateTime.parse(json["endadate"] ?? DateTime.now()),
    // createdDate: DateTime.parse(json["created_date"] ?? DateTime.now()),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "categoryID": categoryId,
    "planid": planid,
    "price": price,
    // "startdate": "${startdate.year.toString().padLeft(4, '0')}-${startdate.month.toString().padLeft(2, '0')}-${startdate.day.toString().padLeft(2, '0')}",
    // "endadate": "${endadate.year.toString().padLeft(4, '0')}-${endadate.month.toString().padLeft(2, '0')}-${endadate.day.toString().padLeft(2, '0')}",
    // "created_date": createdDate.toIso8601String(),
  };
}

class SubscriptionOrders {
  SubscriptionOrders({
    required this.id,
    required this.orderid,
    required this.status,
    required this.price,
    required this.planid,
    required this.transitionOrderid,
    required this.transitionPaymentId,
    required this.signature,
    required this.userid,
    required this.categoryId,
  });

  String id;
  String orderid;
  String status;
  String price;
  String planid;
  String transitionOrderid;
  String transitionPaymentId;
  String signature;
  String userid;
  String categoryId;

  factory SubscriptionOrders.fromJson(Map<String, dynamic> json) => SubscriptionOrders(
    id: json["id"] ?? "",
    orderid: json["orderid"] ?? "",
    status: json["status"] ?? "",
    price: json["price"] ?? "",
    planid: json["planid"] ?? "",
    transitionOrderid: json["transition_orderid"] ?? "",
    transitionPaymentId: json["transition_paymentId"] ?? "",
    signature: json["signature"] ?? "",
    userid: json["userid"] ?? "",
    categoryId: json["categoryID"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderid": orderid,
    "status": status,
    "price": price,
    "planid": planid,
    "transition_orderid": transitionOrderid,
    "transition_paymentId": transitionPaymentId,
    "signature": signature,
    "userid": userid,
    "categoryID": categoryId,
  };
}

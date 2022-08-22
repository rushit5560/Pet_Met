import 'dart:convert';

MeetingOrdersModel meetingOrdersModelFromJson(String str) => MeetingOrdersModel.fromJson(json.decode(str));

String meetingOrdersModelToJson(MeetingOrdersModel data) => json.encode(data.toJson());

class MeetingOrdersModel {
  MeetingOrdersModel({
    required this.success,
    required this.date,
    required this.message,
  });

  bool success;
  Date date;
  String message;

  factory MeetingOrdersModel.fromJson(Map<String, dynamic> json) => MeetingOrdersModel(
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
    // this.order,
    required this.orderdetails,
  });

  // dynamic order;
  List<MeetingOrderDetail> orderdetails;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    // order: json["order"],
    orderdetails: List<MeetingOrderDetail>.from(json["orderdetails"].map((x) => MeetingOrderDetail.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    // "order": order,
    "orderdetails": List<dynamic>.from(orderdetails.map((x) => x.toJson())),
  };
}

class MeetingOrderDetail {
  MeetingOrderDetail({
    required this.id,
    required this.userid,
    required this.categoryId,
    required this.meettingpetuserid,
    required this.meettingpetusercategory,
    required this.userpetid,
    required this.meettingpetid,
    required this.price,
    required this.startdate,
    required this.enddate,
    required this.transitionOrderid,
    required this.transitionPaymentId,
    required this.signature,
  });

  String id;
  String userid;
  String categoryId;
  String meettingpetuserid;
  String meettingpetusercategory;
  String userpetid;
  String meettingpetid;
  String price;
  DateTime startdate;
  DateTime enddate;
  String transitionOrderid;
  String transitionPaymentId;
  String signature;

  factory MeetingOrderDetail.fromJson(Map<String, dynamic> json) => MeetingOrderDetail(
    id: json["id"] ?? "",
    userid: json["userid"] ?? "",
    categoryId: json["categoryID"] ?? "",
    meettingpetuserid: json["meettingpetuserid"] ?? "",
    meettingpetusercategory: json["meettingpetusercategory"] ?? "",
    userpetid: json["userpetid"] ?? "",
    meettingpetid: json["meettingpetid"] ?? "",
    price: json["price"] ?? "",
    startdate: DateTime.parse(json["startdate"] ?? DateTime.now()),
    enddate: DateTime.parse(json["enddate"] ?? DateTime.now()),
    transitionOrderid: json["transition_orderid"] ?? "",
    transitionPaymentId: json["transition_paymentId"] ?? "",
    signature: json["signature"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "categoryID": categoryId,
    "meettingpetuserid": meettingpetuserid,
    "meettingpetusercategory": meettingpetusercategory,
    "userpetid": userpetid,
    "meettingpetid": meettingpetid,
    "price": price,
    "startdate": "${startdate.year.toString().padLeft(4, '0')}-${startdate.month.toString().padLeft(2, '0')}-${startdate.day.toString().padLeft(2, '0')}",
    "enddate": "${enddate.year.toString().padLeft(4, '0')}-${enddate.month.toString().padLeft(2, '0')}-${enddate.day.toString().padLeft(2, '0')}",
    "transition_orderid": transitionOrderid,
    "transition_paymentId": transitionPaymentId,
    "signature": signature,
  };
}

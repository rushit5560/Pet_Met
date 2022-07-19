import 'dart:convert';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  FaqModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<FaqData> data;
  String message;

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    success: json["success"] ?? false,
    data: List<FaqData>.from(json["data"].map((x) => FaqData.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class FaqData {
  FaqData({
    required this.id,
    required this.question,
    required this.answer,
    required this.isActive,
  });

  int id;
  String question;
  String answer;
  String isActive;

  factory FaqData.fromJson(Map<String, dynamic> json) => FaqData(
    id: json["id"] ?? 0,
    question: json["question"] ?? "",
    answer: json["answer"] ?? "",
    isActive: json["is_active"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "answer": answer,
    "is_active": isActive,
  };
}

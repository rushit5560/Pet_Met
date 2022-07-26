class IsActiveAddressModel {
  bool? success;
  String? message;

  IsActiveAddressModel({this.success, this.message});

  IsActiveAddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

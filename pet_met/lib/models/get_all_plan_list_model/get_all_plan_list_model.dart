class AllPlanListModel {
  bool? success;
  List<PlanData>? data;
  String? message;

  AllPlanListModel({this.success, this.data, this.message});

  AllPlanListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <PlanData>[];
      json['data'].forEach((v) {
        data!.add(new PlanData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class PlanData {
  int? id;
  int? rs;
  String? name;
  String? overview;
  String? isActive;
  int? days;

  PlanData(
      {this.id, this.rs, this.name, this.overview, this.isActive, this.days});

  PlanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rs = json['rs'];
    name = json['name'];
    overview = json['overview'];
    isActive = json['is_active'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rs'] = this.rs;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['is_active'] = this.isActive;
    data['days'] = this.days;
    return data;
  }
}
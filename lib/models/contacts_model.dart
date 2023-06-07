import 'package:hive_flutter/adapters.dart';

part 'contacts_model.g.dart';

@HiveType(typeId: 5)
class ContactModel {
  @HiveField(0)
  int? userId;
   @HiveField(1)
  int? id;
   @HiveField(2)
  String? title;

  ContactModel({this.userId, this.id, this.title});

  ContactModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

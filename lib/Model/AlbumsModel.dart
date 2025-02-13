import 'dart:convert';
/// userId : 1
/// id : 1
/// title : "quidem molestiae enim"

AlbumsModel albumsModelFromJson(String str) => AlbumsModel.fromJson(json.decode(str));
String albumsModelToJson(AlbumsModel data) => json.encode(data.toJson());
class AlbumsModel {
  AlbumsModel({
      int? userId, 
      int? id, 
      String? title,}){
    _userId = userId;
    _id = id;
    _title = title;
}

  AlbumsModel.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
  }
  int? _userId;
  int? _id;
  String? _title;

  int? get userId => _userId;
  int? get id => _id;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }

}
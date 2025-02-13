import 'dart:convert';
/// message : "https://images.dog.ceo/breeds/mastiff-english/3.jpg"
/// status : "success"

PhotosModel photosModelFromJson(String str) => PhotosModel.fromJson(json.decode(str));
String photosModelToJson(PhotosModel data) => json.encode(data.toJson());
class PhotosModel {
  PhotosModel({
      String? message, 
      String? status,}){
    _message = message;
    _status = status;
}

  PhotosModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
  }
  String? _message;
  String? _status;

  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}
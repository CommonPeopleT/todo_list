import 'package:flutter/cupertino.dart';

class TodoItem{
  int id;
  String title;
  String detail;

  TodoItem({@required this.title,@required this.detail});
  TodoItem.fromMap({@required this.id,@required this.title,@required this.detail}); // mapから作るとき

  Map<String,dynamic> toMap(){
    return {
      "title" : title,
      "detail" : detail,
    };
  }
}
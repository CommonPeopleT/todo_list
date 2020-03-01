import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_item.dart';

class TodoDetailPage extends StatelessWidget{
  final TodoItem _item;
  TodoDetailPage({@required item}): _item = item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Text(
        this._item.detail,
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
      color: Colors.white,
    );
  }
}
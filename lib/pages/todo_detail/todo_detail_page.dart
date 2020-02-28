import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_item.dart';

class TodoDetailPage extends StatelessWidget{
  final TodoItem item;
  TodoDetailPage({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          child: Text(this.item.detail)
      ),
    );
  }
}
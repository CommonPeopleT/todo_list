import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_item.dart';
import 'package:provider/provider.dart';

import 'edit_todo_bloc.dart';

class EditTodoPage extends StatelessWidget{
  final TodoItem item;
  EditTodoPage({@required this.item});

  @override
  Widget build(BuildContext context) {
    return  Provider<EditTodoBloc>(
      create: (context) => EditTodoBloc(item),
      child: EditTodo(),
      dispose: (context,value) => value.dispose(),
    );
  }

}

class EditTodo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<EditTodoBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("EditTodoPage"),
        ),
        body: Container(
          child: Column(
            children:[
              TextFormField(
                initialValue: bloc.item?.title ?? "",
                enabled: true,
                keyboardType: TextInputType.text,
                onChanged: bloc.onTitleChanged,
                decoration: const InputDecoration(
                  icon: Icon(Icons.text_fields),
                  hintText: 'Title',
                  labelText: 'title',
                ),
              ),
              TextFormField(
                initialValue: bloc.item?.detail ?? "",
                enabled: true,
                keyboardType: TextInputType.text,
                onChanged: bloc.onDetailChanged,
                decoration: const InputDecoration(
                  icon: Icon(Icons.text_fields),
                  hintText: 'Detail',
                  labelText: 'detail',
                ),
              )
            ],
          ),
        )
    );
  }

}
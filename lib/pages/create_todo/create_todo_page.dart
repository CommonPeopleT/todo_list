import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/pages/create_todo/create_todo_bloc.dart';
import 'package:provider/provider.dart';

class CreateTodoPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Provider<CreateTodoBloc>(
      create: (context) => CreateTodoBloc(),
      child: CreateTodo(),
      dispose: (context,value) => value.dispose(),
    );
  }

}

class CreateTodo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CreateTodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("CreateTodoPage"),
      ),
      body: Container(
        child: Column(
          children:[
            TextFormField(
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
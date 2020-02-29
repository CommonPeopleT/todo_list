import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/pages/document/base_document_bloc.dart';
import 'package:todo_list/pages/document/base_document_page.dart';
import 'package:todo_list/pages/document/create_todo/create_todo_bloc.dart';
import 'package:provider/provider.dart';

class CreateTodoPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Provider<BaseDocumentBloc>(
      create: (context) => CreateTodoBloc(),
      child: BaseDocumentPage(),
      dispose: (context,value) => value.dispose(),
    );
  }

}

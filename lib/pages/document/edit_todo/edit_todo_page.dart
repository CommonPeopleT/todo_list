import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_item.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/pages/document/base_document_page.dart';

import '../base_document_bloc.dart';
import 'edit_todo_bloc.dart';

class EditTodoPage extends StatelessWidget{
  final TodoItem _item;
  EditTodoPage({@required item}): _item = item;

  @override
  Widget build(BuildContext context) {
    return  Provider<BaseDocumentBloc>(
      create: (context) => EditTodoBloc(_item),
      child: BaseDocumentPage(),
      dispose: (context,value) => value.dispose(),
    );
  }

}


import 'package:flutter/cupertino.dart';
import 'package:todo_list/model/base_bloc.dart';
import 'package:todo_list/model/todo_item.dart';

abstract class BaseDocumentBloc extends BaseBloc{
  TodoItem item;
  final String appBarTitle;

  BaseDocumentBloc(item,{@required this.appBarTitle}){
    if(item == null)this.item = TodoItem(title: '',detail: '');
    else this.item = item;
  }

  void onTitleChanged(String title){
    item.title = title;
  }
  void onDetailChanged(String detail){
    item.detail = detail;
  }

}
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/model/todo_item.dart';
import 'package:todo_list/pages/document/create_todo/create_todo_bloc.dart';
import 'package:todo_list/pages/document/edit_todo/edit_todo_bloc.dart';

void main(){
  test('create todo bloc test',(){
    var bloc = CreateTodoBloc();
    expect('Create',bloc.appBarTitle);
    expect(true, bloc.item.title.isEmpty);
    expect(true, bloc.item.detail.isEmpty);
  });

  test('edit todo bloc test',(){
    var item = TodoItem(title: 'title',detail: 'detail');
    var bloc = EditTodoBloc(item);

    expect('Edit',bloc.appBarTitle);
    expect(item, bloc.item);
  });

}
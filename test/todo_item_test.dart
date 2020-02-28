import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/model/todo_item.dart';

void main(){
  test('todo_item_constructor', (){
    final todoItem = TodoItem(title: 'title',detail:'detail');
    expect('title',todoItem.title);
    expect('detail', todoItem.detail);
  });
  test('todo_item_toMap', (){
    final todoItem = TodoItem(title: 'title',detail:'detail');
    final map = {
      'title': 'title',
      'detail': 'detail'
    };
    expect(map, todoItem.toMap());
  });
}
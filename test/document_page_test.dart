import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/model/todo_item.dart';
import 'package:todo_list/pages/document/create_todo/create_todo_page.dart';

import 'package:flutter/material.dart';
import 'package:todo_list/pages/document/edit_todo/edit_todo_page.dart';

class CreateTodoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreateTodoPage(),
    );
  }
}


class EditTodoApp extends StatelessWidget {
  final TodoItem item;
  EditTodoApp(this.item);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EditTodoPage(item: item),
    );
  }
}


void main(){

  testWidgets('CreateTodo Page Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(CreateTodoApp());

    expect(find.text('title'), findsOneWidget);
    expect(find.text('detail'), findsOneWidget);
  });


  testWidgets('EditTodo Page Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    TodoItem item = TodoItem(title: 'TANAKA',detail: 'TAROU');
    await tester.pumpWidget(EditTodoApp(item));

    expect(find.text(item.title), findsOneWidget);
    expect(find.text(item.detail), findsOneWidget);
  });

}
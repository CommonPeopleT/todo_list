import 'package:todo_list/model/base_bloc.dart';
import 'package:todo_list/model/todo_item.dart';
import 'package:todo_list/sql/sql_provider.dart';

class CreateTodoBloc extends BaseBloc{
  String title = "";
  String detail = "";

  void onTitleChanged(String title){
    this.title = title;
  }
  void onDetailChanged(String detail){
    this.detail = detail;
  }
  @override
  void dispose() {
    if(title.isEmpty && detail.isEmpty)return;

    var sql = SqlProvider();
    sql.insertItem(
        TodoItem(title: title,detail: detail)
    );
  }

}
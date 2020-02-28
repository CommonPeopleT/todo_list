import 'package:todo_list/model/base_bloc.dart';
import 'package:todo_list/model/todo_item.dart';
import 'package:todo_list/sql/sql_provider.dart';

class EditTodoBloc extends BaseBloc{
  final TodoItem item;
  EditTodoBloc(this.item);

  void onTitleChanged(String title){
    item.title = title;
  }
  void onDetailChanged(String detail){
    item.detail = detail;
  }
  @override
  void dispose() {
    if(item.title.isEmpty && item.detail.isEmpty)return;

    var sql = SqlProvider();
    sql.updateItem(item);
  }

}
import 'package:todo_list/pages/document/base_document_bloc.dart';
import 'package:todo_list/sql/sql_provider.dart';

class CreateTodoBloc extends BaseDocumentBloc{

  CreateTodoBloc([item]) : super(item,appBarTitle: 'Create');

  @override
  void dispose() {
    if(item.title.isEmpty && item.detail.isEmpty)return;

    var sql = SqlProvider();
    sql.insertItem(item);
  }

}
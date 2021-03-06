import 'package:todo_list/pages/document/base_document_bloc.dart';
import 'package:todo_list/sql/sql_provider.dart';

class EditTodoBloc extends BaseDocumentBloc{

  EditTodoBloc(item) : super(item,appBarTitle: 'Edit');

  @override
  void dispose() {
    if(item.title.isEmpty && item.detail.isEmpty)return;

    var sql = SqlProvider();
    sql.updateItem(item);
  }

}
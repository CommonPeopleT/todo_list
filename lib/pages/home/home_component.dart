import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/todo_item.dart';
import 'home_bloc.dart';

class HomeComponent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => bloc.gotoCreateTodoPage(context),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => bloc.requestAllItems(),
          )
        ],
      ),
      body: Container(
        child:
            StreamBuilder<List<TodoItem>>(
                stream: bloc.todoItemListStream,
                builder: (context, snapshot) {
                  if (snapshot.data == null) return CircularProgressIndicator();
                  if (snapshot.data.length == 0) return Text('TODO無し');

                  return ListView(
                    children: <Widget>[
                      for(var item in snapshot.data)
                        listItem(bloc: bloc, context: context, item: item),
                    ],
                  );
                }
            )
        ),
      );
  }
  Widget listItem({@required HomeBloc bloc,@required BuildContext context,@required TodoItem item}){
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 2.5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black38),
        ),
      ),

      child: GestureDetector(
        onTap: () => bloc.showDetailPage(context, item: item),
        onDoubleTap: () => bloc.gotoEditTodoPage(context,item: item),
        onLongPress: () => bloc.showDeleteItemDialog(context, item: item),
        child: Text(
          item.title,
          style: TextStyle(
            fontSize: 32,
          ),
          maxLines: 1,
        ),
      ),

    );
  }
}
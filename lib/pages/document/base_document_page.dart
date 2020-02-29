import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_document_bloc.dart';


class BaseDocumentPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<BaseDocumentBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(bloc.appBarTitle),
        ),
        body: Container(
          child: Column(
            children:[
              TextFormField(
                initialValue: bloc.item?.title ?? "",
                enabled: true,
                keyboardType: TextInputType.text,
                onChanged: bloc.onTitleChanged,
                decoration: const InputDecoration(
                  icon: Icon(Icons.text_fields),
                  hintText: 'Title',
                  labelText: 'title',
                ),
              ),
              TextFormField(
                initialValue: bloc.item?.detail ?? "",
                enabled: true,
                keyboardType: TextInputType.text,
                onChanged: bloc.onDetailChanged,
                decoration: const InputDecoration(
                  icon: Icon(Icons.text_fields),
                  hintText: 'Detail',
                  labelText: 'detail',
                ),
              )
            ],
          ),
        )
    );
  }

}
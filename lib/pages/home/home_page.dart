import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/pages/home/home_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/pages/home/home_component.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return  Provider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: HomeComponent(),
      dispose: (context,HomeBloc value) => value.dispose(),
    );

  }

}
import 'package:flutter/material.dart';
import 'package:flutter_application_bloc_mvvm/UI/home_page.dart';
import 'package:flutter_application_bloc_mvvm/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MVVM Bloc'),
        ),
        body: BlocProvider(
          create: (context) => UserBloc(),
          child: HomePage(),
        ),
      ),
    );
  }
}

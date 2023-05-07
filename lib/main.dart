import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/blocs/app_blocs.dart';
import 'package:user/repos/repositories.dart';
import 'package:user/screen/OneUser_Screen.dart';
import 'package:user/screen/userList_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(UserRepository()),
      child: MaterialApp(routes: {
        '/': ((context) => UserList()),
        '/OneUser': ((context) => OneUser()),
      }),
    );
  }
}

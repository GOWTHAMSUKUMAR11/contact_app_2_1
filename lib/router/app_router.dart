import 'package:flutter/material.dart';
import 'package:user/screen/OneUser_Screen.dart';
import 'package:user/screen/userList_Screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final Object? key = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => UserList());
      case '/Oneuser':
        return MaterialPageRoute(builder: (_) => OneUser());
      default:
        return null;
    }
  }
}

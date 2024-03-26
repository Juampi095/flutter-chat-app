import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/loading_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/views/users_view.dart';
import 'package:flutter/material.dart';

//<String, Widget Function(BuildContext)> Siempre es necesario para colocar routes en main.dart
final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => const UsersPage(),
  'chat': (_) => const ChatPage(),
  'login': (_) => const LoginPage(),
  'register': (_) => const RegisterPage(),
  'loading': (_) => const LoadingPage(),
};

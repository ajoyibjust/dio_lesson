import 'package:dio_lesson/blocs/user_bloc.dart';
import 'package:dio_lesson/data/dio_client.dart';
import 'package:dio_lesson/repository/user_repository.dart';
import 'package:dio_lesson/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final dioClient = DioClient();
  final userRepository = UserRepository(dioClient);

  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => UserBloc(userRepository),
        child: MainScreen(),
      ),
    );
  }
}

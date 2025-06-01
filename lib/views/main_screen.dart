import 'package:dio_lesson/blocs/user_bloc.dart';
import 'package:dio_lesson/blocs/user_event.dart';
import 'package:dio_lesson/blocs/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<UserBloc>().add(FetchUsersEvent());
                },
                child: Text('Foydalanuvchilarni yuklash'),
              ),
            );
          } else if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          } else if (state is UserError) {
            return Center(child: Text('Xatolik: ${state.message}'));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

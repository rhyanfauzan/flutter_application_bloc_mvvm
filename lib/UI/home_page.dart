import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../model/service.dart';

class HomePage extends StatelessWidget {
  static final _service = Service();
  static final _random = Random();
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () async {
                context.read<UserBloc>().add(_random.nextInt(12) + 1);
              },
              child: Text('Random Data')),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserInitialized) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(state.user.avatar),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${state.user.firstName} ${state.user.lastName}',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(state.user.email),
                    SizedBox(
                      height: 4,
                    ),
                    Text(state.user.id.toString())
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserInitialized extends UserState {
  final User user;

  UserInitialized(this.user);
}

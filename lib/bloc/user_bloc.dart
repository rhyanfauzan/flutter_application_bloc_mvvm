import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../model/service.dart';
import '../model/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<int, UserState> {
  final _service = Service();
  UserBloc() : super(UserInitial()) {
    on<int>((event, emit) async {
      emit(UserInitial());
      try {
        final user = await _service.getData(event);
        emit(UserInitialized(user));
      } catch (e) {
        rethrow;
      }
      // TODO: implement event handler
    });
  }
}

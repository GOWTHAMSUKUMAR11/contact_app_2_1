import 'package:user/model/userDetails.dart';
import 'package:user/repos/repositories.dart';
import './app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserState([])) {
    loadUser();
  }

  void loadUser() async {
    try {
      final user_temp = await _userRepository.getDetails();
      emit(UserState(user_temp));
    } catch (e) {
      print("something went wrong");
    }
  }

  void addUser(UserDetails u) {
    try {
      final user_temp = state.users;
      u.id = (state.users.length + 500).toString();
      user_temp.add(u);
      print(u.id);

      emit(UserState(user_temp));
    } catch (e) {
      print("something went wrong");
    }
  }

  void deleteUser(int id) {
    final user_temp = state.users;
    print(findUser(id));
    user_temp.removeAt(findUser(id));
    emit(UserState(user_temp));
  }

  void modifyUser(int id, UserDetails u) {
    final user_temp = state.users;
    int index = findUser(id);
    user_temp[index] = u;
    emit(UserState(user_temp));
  }

  int findUser(int id) {
    int _index = -1;
    int index = 0;

    for (UserDetails x in state.users) {
      if (int.parse(x.id) == id) {
        _index = index;
        break;
      }
      index++;
    }
    return index;
  }
}

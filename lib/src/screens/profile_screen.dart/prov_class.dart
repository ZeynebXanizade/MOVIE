import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_dovie/src/screens/profile_screen.dart/user_configure_class.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(User(name: '', surname: '', age: '', gender: ''));

  void updateUser(User updateUser) {
    state = updateUser;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});

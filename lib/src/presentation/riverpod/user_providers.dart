
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domains/models/user_model.dart';
class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(User(name: '', surname: '', age: '', gender: ''));

  void updateUser(User updateUser) {
    state = updateUser;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});
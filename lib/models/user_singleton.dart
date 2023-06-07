class UserSingleton {
  static final UserSingleton _instance = UserSingleton._internal();
  String? _userEmail;

  factory UserSingleton() {
    return _instance;
  }

  UserSingleton._internal();

  void setUserEmail(String email) {
    _userEmail = email;
  }

  String? getUserEmail() {
    return _userEmail;
  }
}
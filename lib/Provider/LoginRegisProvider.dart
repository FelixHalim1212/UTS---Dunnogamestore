import 'package:dunnostore/Model/LoginModel.dart';
import 'package:flutter/material.dart';

class UserLoginProvider with ChangeNotifier {
  List<UserLoginModel> _userLoginList = [
    UserLoginModel(
        id: '1', username: 'putra', email: 'putra@gmail.com', password: '123'),
  ];

  List<UserLoginModel> get userLoginList => _userLoginList;

  String _idUserDoLogin = '';
  String get idUserDoLogin => _idUserDoLogin;

  void userDoLogin(id) {
    _idUserDoLogin = id;
    notifyListeners();
  }

  void register(UserLoginModel user) {
    _userLoginList.add(user);
    notifyListeners();
  }
}

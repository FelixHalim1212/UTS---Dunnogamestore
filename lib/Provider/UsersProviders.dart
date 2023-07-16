import 'package:dunnostore/Model/UsersModel.dart';
import 'package:flutter/material.dart';

class UsersProvider with ChangeNotifier {
  List<UsersModel> _usersList = [];

  List<UsersModel> get usersList => _usersList;

  void addUsers(UsersModel user) {
    _usersList.add(user);
    notifyListeners();
  }

  // Metode untuk mengupdate data user berdasarkan ID
  void updateUser(String id, UsersModel updatedUser) {
    final index = _usersList.indexWhere((user) => user.id == id);
    if (index >= 0) {
      _usersList[index] = updatedUser;
      notifyListeners();
    } else {
      throw Exception('User not found');
    }
  }

  // Metode untuk mengupdate data user berdasarkan ID
  void deductSaldo(String id, int total) {
    final index = _usersList.indexWhere((user) => user.id == id);
    if (index >= 0) {
      _usersList[index].pengeluaran += total;
      _usersList[index].saldo -= total;
      notifyListeners();
    } else {
      throw Exception('User not found');
    }
  }

  // Metode untuk mengupdate data user berdasarkan ID
  void topUpMySaldo(String id, int total) {
    final index = _usersList.indexWhere((user) => user.id == id);
    if (index >= 0) {
      _usersList[index].saldo += total;
      notifyListeners();
    } else {
      throw Exception('User not found');
    }
  }

  // Metode untuk mendapatkan data user berdasarkan ID
  UsersModel getUserById(String id) {
    return _usersList.firstWhere((user) => user.id == id);
  }
}

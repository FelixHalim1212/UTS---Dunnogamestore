import 'package:dunnostore/Model/TransaksiModel.dart';
import 'package:flutter/material.dart';

class TransaksiProvider with ChangeNotifier {
  List<TransaksiModel> _transaksiList = [];

  List<TransaksiModel> get transaksiList => _transaksiList;

  void addTransaksi(TransaksiModel user) {
    _transaksiList.add(user);
    notifyListeners();
  }
}

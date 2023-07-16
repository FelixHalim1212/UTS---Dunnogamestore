import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void myNotif(String msg, Color color) {
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.black,
      fontSize: 16.0);
}

int getTotalTopUpSaldo(total, fees) {
  return total + fees;
}

String formatRupiah(int nominal) {
  String rupiah = nominal.toString();
  final int length = rupiah.length;
  String result = '';
  int count = 0;

  for (int i = length - 1; i >= 0; i--) {
    result = rupiah[i] + result;
    count++;
    if (count % 3 == 0 && i != 0) {
      result = '.' + result;
    }
  }

  return result;
}

String hideOrderId(id) {
  return id.substring(0, 2) + '****' + id.substring(6);
}

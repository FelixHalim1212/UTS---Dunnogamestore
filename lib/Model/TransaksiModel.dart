import 'package:flutter/material.dart';

class TransaksiModel {
  final String id;
  final String idUser;
  final String idGame;
  final String userIdInTopup;
  final String diamondTopup;
  final int priceTopup;
  final String metodePembayaranTopup;
  final String nomorWATopup;
  final String tglTransaksi;

  TransaksiModel({
    required this.id,
    required this.idUser,
    required this.idGame,
    required this.userIdInTopup,
    required this.diamondTopup,
    required this.priceTopup,
    required this.metodePembayaranTopup,
    required this.nomorWATopup,
    required this.tglTransaksi,
  });
}

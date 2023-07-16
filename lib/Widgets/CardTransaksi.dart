import 'package:dunnostore/Utils/color_constants.dart';
import 'package:dunnostore/Utils/data.dart';
import 'package:flutter/material.dart';

import '../Utils/Global_Function.dart';

class CardTransaksiWidget extends StatelessWidget {
  final data;
  const CardTransaksiWidget({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> datagame =
        listAllGame.firstWhere((game) => game['id'] == data.idGame);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.backgroundWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(datagame['cover']),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${datagame['nameGame']}',
                    style: TextStyle(fontFamily: 'Lemon'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${data.tglTransaksi}'),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    'Rp ${formatRupiah(data.priceTopup)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text('order ID : ${hideOrderId(data.id)}'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

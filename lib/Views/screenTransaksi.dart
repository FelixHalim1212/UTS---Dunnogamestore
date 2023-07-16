import 'package:dunnostore/Provider/LoginRegisProvider.dart';
import 'package:dunnostore/Provider/Transaksiprovider.dart';
import 'package:dunnostore/Provider/UsersProviders.dart';
import 'package:dunnostore/Widgets/CardTransaksi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class TransaksiScreen extends StatefulWidget {
  const TransaksiScreen({super.key});

  @override
  State<TransaksiScreen> createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {
  @override
  Widget build(BuildContext context) {
    final provTransaksi = Provider.of<TransaksiProvider>(context);
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UsersProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              children: provTransaksi.transaksiList
                  .where((allTransaksi) => allTransaksi.idUser == user.id)
                  .map((allTransaksi) {
            return CardTransaksiWidget(data: allTransaksi);
          }).toList()),
        ),
      ),
    );
  }
}

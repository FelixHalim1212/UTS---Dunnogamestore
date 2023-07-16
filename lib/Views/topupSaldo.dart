import 'package:dunnostore/Provider/LoginRegisProvider.dart';
import 'package:dunnostore/Provider/UsersProviders.dart';
import 'package:dunnostore/Views/screenProfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../Utils/Global_Function.dart';

class TopUpSaldoScreen extends StatefulWidget {
  const TopUpSaldoScreen({super.key});

  @override
  State<TopUpSaldoScreen> createState() => _TopUpSaldoScreenState();
}

class _TopUpSaldoScreenState extends State<TopUpSaldoScreen> {
  final TextEditingController _inputJumlahController = TextEditingController();
  int fees = 3000;
  @override
  Widget build(BuildContext context) {
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UsersProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);

    final provGetUser = Provider.of<UsersProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Up Saldo',
                      style: TextStyle(fontFamily: 'lemon', fontSize: 18),
                    ),
                    Text('lorem ipsum dolor amet')
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                          child: TextField(
                    controller: _inputJumlahController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black), // Warna garis bawah
                      ),
                      hintText: 'Rp',
                    ),
                  ))),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Minimal Topup Rp 10.000',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Total Top Up',
                            ),
                          ),
                          Container(
                            child: Text(
                              'Rp ${_inputJumlahController.text}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Transaksi Fees',
                            ),
                          ),
                          Container(
                            child: Text(
                              'Rp ${_inputJumlahController.text.isNotEmpty ? fees : '-'}', //jika total masih kosong maka tampil kan '-'
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Total',
                            ),
                          ),
                          Container(
                            child: Text(
                              'Rp ${_inputJumlahController.text.isNotEmpty ? getTotalTopUpSaldo(_inputJumlahController.text.isNotEmpty ? int.parse(_inputJumlahController.text) : 0, fees) : '-'}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          trailing: ElevatedButton(
                            onPressed: () {
                              if (_inputJumlahController.text.isEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            height: 180,
                                            width: 250,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 50, 5, 5),
                                              child: Column(
                                                children: [
                                                  Text('Gagal!',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center),
                                                  SizedBox(height: 10),
                                                  Text(
                                                      'Upps! Masukan Jumlah Top up',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center),
                                                  SizedBox(height: 20),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('OK'),
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors
                                                            .red,
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 15,
                                                                horizontal:
                                                                    35)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: -30,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.white,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.red,
                                                  radius: 26,
                                                  child: Icon(Icons.close,
                                                      size: 30,
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                return;
                              }
                              if (int.parse(_inputJumlahController.text) <=
                                  10000) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            height: 180,
                                            width: 250,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 50, 5, 5),
                                              child: Column(
                                                children: [
                                                  Text('Gagal!',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center),
                                                  SizedBox(height: 10),
                                                  Text(
                                                      'Nominal Top up Tidak Mencukupi',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center),
                                                  SizedBox(height: 20),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('OK'),
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors
                                                            .red,
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 15,
                                                                horizontal:
                                                                    35)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: -30,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.white,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.red,
                                                  radius: 26,
                                                  child: Icon(Icons.close,
                                                      size: 30,
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                return;
                              }

                              provGetUser.topUpMySaldo(user.id,
                                  int.parse(_inputJumlahController.text));
                              Navigator.of(context).pop(MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          height: 180,
                                          width: 250,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                5, 50, 5, 5),
                                            child: Column(
                                              children: [
                                                Text('Berhasil',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                                SizedBox(height: 10),
                                                Text(
                                                    'Saldo Anda Berhasil diisi',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center),
                                                SizedBox(height: 20),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('OK'),
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.green,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 15,
                                                          horizontal: 35)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: -30,
                                            child: CircleAvatar(
                                              radius: 30,
                                              backgroundColor: Colors.white,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.green,
                                                radius: 26,
                                                child: Icon(Icons.check,
                                                    size: 30,
                                                    color: Colors.white),
                                              ),
                                            )),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Beli',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                primary: Color(0xff61008F)),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

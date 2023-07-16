import 'package:dunnostore/Model/LoginModel.dart';
import 'package:dunnostore/Model/TransaksiModel.dart';
import 'package:dunnostore/Provider/LoginRegisProvider.dart';
import 'package:dunnostore/Provider/Transaksiprovider.dart';
import 'package:dunnostore/Provider/UsersProviders.dart';
import 'package:dunnostore/Utils/data.dart';
import 'package:dunnostore/Views/ScreenTransaksi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../Utils/Global_Function.dart';
import '../Utils/color_constants.dart';

class TopupGameScreen extends StatefulWidget {
  final data;
  const TopupGameScreen({super.key, this.data});

  @override
  State<TopupGameScreen> createState() => _TopupGameScreenState();
}

class _TopupGameScreenState extends State<TopupGameScreen> {
  String? selectedDiamond;
  String? selectedPrice;
  String? selectedMetode;
  final TextEditingController _InputuserIdGameTopup = TextEditingController();
  final TextEditingController _InputNoWA = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provGetUser = Provider.of<UsersProvider>(context);
    var uuid = Uuid();
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UsersProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);

    final provTransaksi = Provider.of<TransaksiProvider>(context);

    DateTime now = DateTime.now();
    String dateNow =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        title: Text('DunnoStore'),
        backgroundColor: ColorConstants.primaryColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  width: 300,
                  child: Column(children: [
                    Image.asset(widget.data['cover']),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            widget.data['nameGame'],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lemon',
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            widget.data['Descripsi'],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lemon',
                                fontSize: 13),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            '${widget.data['nameGame']} Top-Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lemon',
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'User ID',
                                    style: TextStyle(
                                        fontFamily: 'Lemon', fontSize: 20),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: TextField(
                                    controller: _InputuserIdGameTopup,
                                    decoration: InputDecoration(
                                      hintText: 'User ID',
                                      filled: true,
                                      fillColor: Color(0xffF1F6F9),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade200,
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 2.0,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      // tambahkan shadow
                                    ),
                                  ),
                                )
                              ],
                            )),
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Jumlah Diamond',
                                    style: TextStyle(
                                        fontFamily: 'Lemon', fontSize: 20),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    child: GridView.count(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      crossAxisCount: 2,
                                      childAspectRatio: 2,
                                      children: List.generate(
                                        widget.data['price'].length,
                                        (index) => Padding(
                                          padding: EdgeInsets.all(10),
                                          child: ChoiceChip(
                                            // labelPadding: EdgeInsets.symmetric(
                                            //     vertical: 10),
                                            label: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child: Text(
                                                    '${widget.data['price'][index][0]} Diamond',
                                                    style: TextStyle(
                                                      color: selectedDiamond ==
                                                              widget
                                                                  .data['price']
                                                                      [index][0]
                                                                  .toString()
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child: Text(
                                                    'Rp ${formatRupiah(widget.data['price'][index][1])}',
                                                    style: TextStyle(
                                                      color: selectedDiamond ==
                                                              widget
                                                                  .data['price']
                                                                      [index][0]
                                                                  .toString()
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            selected: selectedDiamond ==
                                                widget.data['price'][index][0],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              side: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                width: 2,
                                              ),
                                            ),
                                            backgroundColor: selectedDiamond ==
                                                    widget.data['price'][index]
                                                            [0]
                                                        .toString()
                                                ? ColorConstants.backgroundColor
                                                : Color(0xffF1F6F9),
                                            onSelected: (selected) {
                                              setState(() {
                                                selectedDiamond = selected
                                                    ? widget.data['price']
                                                            [index][0]
                                                        .toString()
                                                    : null;
                                                selectedPrice = selected
                                                    ? widget.data['price']
                                                            [index][1]
                                                        .toString()
                                                    : null;
                                                print(selectedPrice);
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Metode Pembayaran',
                                    style: TextStyle(
                                        fontFamily: 'Lemon', fontSize: 20),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    child: GridView.count(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      crossAxisCount: 1,
                                      childAspectRatio: 4,
                                      children: List.generate(
                                        listMetodepembayaran.length,
                                        (index) => Padding(
                                          padding: EdgeInsets.all(10),
                                          child: ChoiceChip(
                                            // labelPadding: EdgeInsets.symmetric(
                                            //     vertical: 10),
                                            label: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  child: Container(
                                                    width: 100,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Image.asset(
                                                      listMetodepembayaran[
                                                          index]['imgMetode'],
                                                      width: 80,
                                                      height: 50,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            selected: selectedMetode ==
                                                listMetodepembayaran[index]
                                                    ['nameMetode'],
                                            selectedColor:
                                                ColorConstants.backgroundColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              side: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                width: 2,
                                              ),
                                            ),
                                            backgroundColor: selectedMetode ==
                                                    listMetodepembayaran[index]
                                                        ['nameMetode']
                                                ? ColorConstants.backgroundColor
                                                : Color(0xffF1F6F9),
                                            onSelected: (selected) {
                                              setState(() {
                                                selectedMetode = selected
                                                    ? listMetodepembayaran[
                                                        index]['nameMetode']
                                                    : null;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Konfirmasi',
                                    style: TextStyle(
                                        fontFamily: 'Lemon', fontSize: 20),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: TextField(
                                    controller: _InputNoWA,
                                    decoration: InputDecoration(
                                      hintText: 'Nomor Whatsapp',
                                      filled: true,
                                      fillColor: Color(0xffF1F6F9),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade200,
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 2.0,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      // tambahkan shadow
                                    ),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.bottomLeft,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          value: true,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              // true = value!;
                                            });
                                          },
                                        ),
                                        Text('Accept'),
                                      ],
                                    )),
                                Container(
                                    alignment: Alignment.bottomRight,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(top: 20),
                                    child: SizedBox(
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          //cek apakah metode dengan saldo saya
                                          if (selectedMetode.toString() ==
                                              'Saldo') {
                                            // jika ya cek lagi apakah saldo mencukupi
                                            if (user.saldo <=
                                                int.parse(
                                                    selectedPrice.toString())) {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Container(
                                                          height: 180,
                                                          width: 250,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(5, 50,
                                                                    5, 5),
                                                            child: Column(
                                                              children: [
                                                                const Text('',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center),
                                                                SizedBox(
                                                                    height: 10),
                                                                const Text(
                                                                    'Saldo Anda Tidak Mencukupi',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center),
                                                                SizedBox(
                                                                    height: 20),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      'OK'),
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              15,
                                                                          horizontal:
                                                                              35)),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Positioned(
                                                            top: -30,
                                                            child: CircleAvatar(
                                                              radius: 30,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Colors.red,
                                                                radius: 26,
                                                                child: Icon(
                                                                    Icons.close,
                                                                    size: 30,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                              return;
                                            }
                                            provGetUser.deductSaldo(
                                                user.id,
                                                int.parse(
                                                    selectedPrice.toString()));
                                            provTransaksi.addTransaksi(
                                                TransaksiModel(
                                                    id: uuid
                                                        .v1()
                                                        .substring(0, 8),
                                                    idUser: user.id,
                                                    idGame: widget.data['id'],
                                                    userIdInTopup:
                                                        _InputuserIdGameTopup
                                                            .text,
                                                    diamondTopup:
                                                        selectedDiamond
                                                            .toString(),
                                                    priceTopup: int.parse(
                                                        selectedPrice
                                                            .toString()),
                                                    metodePembayaranTopup:
                                                        selectedMetode
                                                            .toString(),
                                                    nomorWATopup:
                                                        _InputNoWA.text,
                                                    tglTransaksi: dateNow));

                                            Navigator.of(context).pop(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TransaksiScreen()));
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Container(
                                                        height: 180,
                                                        width: 250,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  5, 50, 5, 5),
                                                          child: Column(
                                                            children: [
                                                              const Text(
                                                                  'Berhasil',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center),
                                                              SizedBox(
                                                                  height: 10),
                                                              const Text(
                                                                  'Top up Game Berhasil!',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center),
                                                              SizedBox(
                                                                  height: 20),
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Text('OK'),
                                                                style: ElevatedButton.styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            15,
                                                                        horizontal:
                                                                            35)),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const Positioned(
                                                          top: -30,
                                                          child: CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor:
                                                                Colors.white,
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.green,
                                                              radius: 26,
                                                              child: Icon(
                                                                  Icons.check,
                                                                  size: 30,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            return;
                                          }
                                          provTransaksi.addTransaksi(
                                              TransaksiModel(
                                                  id: uuid.v1().substring(0, 8),
                                                  idUser: user.id,
                                                  idGame: widget.data['id'],
                                                  userIdInTopup:
                                                      _InputuserIdGameTopup
                                                          .text,
                                                  diamondTopup: selectedDiamond
                                                      .toString(),
                                                  priceTopup: int.parse(
                                                      selectedPrice.toString()),
                                                  metodePembayaranTopup:
                                                      selectedMetode.toString(),
                                                  nomorWATopup: _InputNoWA.text,
                                                  tglTransaksi: dateNow));

                                          Navigator.of(context).pop(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TransaksiScreen()));

                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      height: 180,
                                                      width: 250,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5, 50, 5, 5),
                                                        child: Column(
                                                          children: [
                                                            Text('Berhasil',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                            SizedBox(
                                                                height: 10),
                                                            Text(
                                                                'Saldo Anda Berhasil diisi',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                            SizedBox(
                                                                height: 20),
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text('OK'),
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .green,
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          15,
                                                                      horizontal:
                                                                          35)),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const Positioned(
                                                        top: -30,
                                                        child: CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Colors.green,
                                                            radius: 26,
                                                            child: Icon(
                                                                Icons.check,
                                                                size: 30,
                                                                color: Colors
                                                                    .white),
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
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: 'Lemon'),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            primary: Color(0xff61008F)),
                                      ),
                                    )),
                              ],
                            )),
                          ]),
                        ),
                      ],
                    )),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

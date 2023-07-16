import 'package:dunnostore/Utils/color_constants.dart';
import 'package:dunnostore/Views/ScreenLogin.dart';
import 'package:dunnostore/Views/topupSaldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/LoginRegisProvider.dart';
import '../Provider/UsersProviders.dart';
import '../Utils/Global_Function.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UsersProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: ColorConstants.primaryColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1684692379211-070d3dbad146?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyM3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
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
                            '${user.username}',
                            style: TextStyle(
                                fontFamily: 'Lemon',
                                color: ColorConstants.backgroundWhite),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${user.noHp}',
                            style: TextStyle(
                                color: ColorConstants.backgroundWhite,
                                fontFamily: 'Lemon'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      primary: Color(0xFFB799FF)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TopUpSaldoScreen()));
                                  },
                                  child: Text(
                                    'Top Up',
                                    style: TextStyle(
                                        fontFamily: 'Lemon',
                                        color: ColorConstants.backgroundWhite),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      primary: ColorConstants.backgroundWhite),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                        fontFamily: 'Lemon',
                                        color: ColorConstants.textColor),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ColorConstants.backgroundWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            'Saldo',
                            style: TextStyle(fontFamily: 'Lemon'),
                          ),
                          Text(
                            'Rp ${formatRupiah(user.saldo)}',
                            style: TextStyle(
                                color: ColorConstants.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            'Pengeluaran',
                            style: TextStyle(fontFamily: 'Lemon'),
                          ),
                          Text(
                            'Rp ${formatRupiah(user.pengeluaran)}',
                            style: TextStyle(
                                color: ColorConstants.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ColorConstants.backgroundWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(child: Text('Pusat Akun')),
                            Container(
                              child: Icon(Icons.arrow_right),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(child: Text('Syarat & Ketentuan')),
                            Container(
                              child: Icon(Icons.arrow_right),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(child: Text('Keamanan Akun')),
                            Container(
                              child: Icon(Icons.arrow_right),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(child: Text('Money')),
                            Container(
                              child: Icon(Icons.arrow_right),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ColorConstants.backgroundWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(child: Text('Profile')),
                            Container(
                              child: Icon(Icons.arrow_right),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(child: Text('Syarat & Ketentuan')),
                            Container(
                              child: Icon(Icons.arrow_right),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(child: Text('Kebijakan Privasi')),
                            Container(
                              child: Icon(Icons.arrow_right),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

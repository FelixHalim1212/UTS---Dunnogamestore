import 'package:dunnostore/Provider/LoginRegisProvider.dart';
import 'package:dunnostore/Provider/UsersProviders.dart';
import 'package:dunnostore/Views/screenFillProfil.dart';
import 'package:dunnostore/Views/ScreenRegistrasi.dart';
import 'package:dunnostore/Views/mainBottomNav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/Global_Function.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _inputEmailUserController =
      TextEditingController();
  final TextEditingController _InputPasswordUserController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provLogin = Provider.of<UserLoginProvider>(context);
    final provUsers = Provider.of<UsersProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                children: [
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Color(0xff61008F),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: TextButton(
                                    onPressed: () => {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegistrasiScreen()))
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ))),
                        ),
                        Expanded(
                          child: Container(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 80, bottom: 20),
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(fontFamily: 'Lemon'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: _inputEmailUserController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(16.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          // tambahkan shadow
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: _InputPasswordUserController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Password',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(16.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),

                          // tambahkan shadow
                        ),
                      )),
                  Container(
                      width: 340,
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            //cari userlogin apakah ada atau tidak
                            final isFound = provLogin.userLoginList.any(
                                (user) =>
                                    user.email ==
                                        _inputEmailUserController.text &&
                                    user.password ==
                                        _InputPasswordUserController.text);
                            //jika ada maka
                            if (isFound) {
                              //ambil data yg login itu
                              final dataUser =
                                  provLogin.userLoginList.firstWhere(
                                (user) =>
                                    user.email ==
                                        _inputEmailUserController.text &&
                                    user.password ==
                                        _InputPasswordUserController.text,
                              );

                              //simpan id user yg login
                              provLogin.userDoLogin(dataUser.id);

                              // cek apakah yg login sudah melengkapi profile nya
                              // dengan cara bandingkan apakah idlogin sudah ada di users
                              // *note idusers == idLoginUsers
                              final findUser = provUsers.usersList
                                  .any((user) => user.id == dataUser.id);

                              //jika tidak, maka lempar dia kehalaman lengkapi profile
                              if (!findUser) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FormProfileScreen(
                                            data: dataUser,
                                            tipe: 'fill',
                                          )),
                                );
                                //jika sudah lengkap, maka lempar dia ke home langsung
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BottomNavMain()));
                              }

                              //jika userlogin tidak ditemukan maka muncul notif
                            } else {
                              myNotif('Your Password or Email is incorrect',
                                  Colors.red);
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              primary: Color(0xff61008F)),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Color(0xff61008F),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(''),
            )
          ],
        ),
      ),
    );
  }
}

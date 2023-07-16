import 'package:dunnostore/Model/LoginModel.dart';
import 'package:dunnostore/Provider/LoginRegisProvider.dart';
import 'package:dunnostore/Views/ScreenLogin.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

import '../Utils/Global_Function.dart';

class RegistrasiScreen extends StatefulWidget {
  const RegistrasiScreen({super.key});

  @override
  State<RegistrasiScreen> createState() => _RegistrasiScreenState();
}

class _RegistrasiScreenState extends State<RegistrasiScreen> {
  final TextEditingController _inputUsernameController =
      TextEditingController();
  final TextEditingController _inputEmailUserController =
      TextEditingController();
  final TextEditingController _inputPasswordUserController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserLoginProvider>(context);
    var uuid = Uuid();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 0),
                    width: double.infinity,
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
                                    onPressed: () => {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()))
                                    },
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
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Create An Account',
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
                        controller: _inputUsernameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Username',
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
                        controller: _inputPasswordUserController,
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
                            if (_inputUsernameController.text != '' ||
                                _inputEmailUserController.text != '' ||
                                _inputPasswordUserController.text != '') {
                              prov.register(UserLoginModel(
                                  id: uuid.v1(),
                                  username: _inputUsernameController.text,
                                  email: _inputEmailUserController.text,
                                  password: _inputPasswordUserController.text));

                              myNotif('Your Account is Successfully Created',
                                  Colors.green);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            } else {
                              myNotif('Failed, Your Data is Not Complete',
                                  Colors.red);
                            }
                          },
                          child: Text(
                            'Sign Up',
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

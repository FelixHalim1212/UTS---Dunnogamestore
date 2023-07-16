import 'package:dunnostore/Model/UsersModel.dart';
import 'package:dunnostore/Provider/UsersProviders.dart';
import 'package:dunnostore/Utils/Global_Function.dart';
import 'package:dunnostore/Utils/color_constants.dart';
import 'package:dunnostore/Views/ScreenLogin.dart';
import 'package:dunnostore/Views/mainBottomNav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';

class FormProfileScreen extends StatefulWidget {
  final data;
  final String tipe;
  const FormProfileScreen({super.key, this.data, required this.tipe});

  @override
  State<FormProfileScreen> createState() => _FormProfileScreenState();
}

class _FormProfileScreenState extends State<FormProfileScreen> {
  final TextEditingController _inputUsernameController =
      TextEditingController();
  final TextEditingController _inputEmailController = TextEditingController();
  final TextEditingController _inputPonselController = TextEditingController();
  String genderValue = 'Male';
  String? dateofBirth;

  @override
  void initState() {
    super.initState();
    _inputUsernameController.text = widget.data.username ?? '';
    _inputEmailController.text = widget.data.email ?? '';
    dateofBirth = widget.tipe == 'fill' ? null : widget.data.dateOfBirth;
    genderValue = widget.tipe == 'fill' ? 'Male' : widget.data.gender;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> listGender = <String>['Male', 'Female'];
    final prov = Provider.of<UsersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        title:
            Text(widget.tipe == 'fill' ? 'Complate Profile' : 'Update Profil'),
        actions: [
          TextButton(
              onPressed: () {
                if (widget.tipe == 'fill') {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                } else {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => ProfileScreen()));
                }
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: ColorConstants.backgroundWhite),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: ColorConstants.backgroundWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  child: const Text(
                            'Username',
                            style: TextStyle(color: Colors.grey),
                          ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: TextField(
                                    controller: _inputUsernameController,
                                    textAlign: TextAlign.right,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Username Anda',
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  child: const Text(
                            'Email',
                            style: TextStyle(color: Colors.grey),
                          ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: TextField(
                                    style: TextStyle(color: Colors.grey),
                                    controller: _inputEmailController,
                                    enabled: false,
                                    textAlign: TextAlign.right,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Email Anda',
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  child: const Text(
                            'Phone',
                            style: TextStyle(color: Colors.grey),
                          ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: TextField(
                                    controller: _inputPonselController,
                                    textAlign: TextAlign.right,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Nomor Anda',
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  child: const Text(
                            'Gender',
                            style: TextStyle(color: Colors.grey),
                          ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: DropdownButton<String>(
                                    value: genderValue,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onChanged: (String? value) {
                                      setState(() {
                                        genderValue = value!;
                                      });
                                    },
                                    items: listGender
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    underline: Container(),
                                  ))),
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  child: const Text(
                            'Date of birth',
                            style: TextStyle(color: Colors.grey),
                          ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: DateTimePicker(
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    initialValue: dateofBirth,
                                    timeHintText: 'dateofBirth',
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    onChanged: (val) => {dateofBirth = val},
                                    validator: (val) {
                                      dateofBirth = val;
                                      return null;
                                    },
                                    onSaved: (val) => {dateofBirth = val},
                                  ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (_inputUsernameController.text == '' ||
                        _inputEmailController.text == '' ||
                        _inputPonselController.text == '' ||
                        dateofBirth == null) {
                      myNotif('Failed, Your data Not Complate', Colors.red);
                      return;
                    }

                    if (widget.tipe == 'fill') {
                      prov.addUsers(UsersModel(
                          id: widget.data.id,
                          username: _inputUsernameController.text,
                          email: _inputEmailController.text,
                          noHp: _inputPonselController.text,
                          saldo: 0,
                          pengeluaran: 0,
                          gender: genderValue,
                          dateOfBirth: dateofBirth.toString()));

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomNavMain()));
                    } else {
                      // prov.updateUser(
                      //     widget.data.id,
                      //     UsersModel(
                      //         id: widget.data.id,
                      //         username: _inputUsernameController.text,
                      //         email: _inputEmailController.text,
                      //         noHp: _inputPonselController.text,
                      //         gender: genderValue,
                      //         dateOfBirth: dateofBirth.toString()));

                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => ProfileScreen()));
                    }
                  },
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: ColorConstants.primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

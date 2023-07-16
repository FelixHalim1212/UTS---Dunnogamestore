import 'package:dunnostore/Views/ScreenTransaksi.dart';
import 'package:dunnostore/Views/mainBottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Utils/color_constants.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Center(
              child: Column(children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'GREETINGS!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.primaryColor,
                              fontSize: 30),
                        ),
                      ),
                      Container(
                        child: Text(
                          'p',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.primaryColor,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Image.asset(
                              'assets/images/ilustration-success.png')),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(children: [
                          Expanded(
                              child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BottomNavMain()));
                            },
                            child: Text(
                              "Home",
                              style:
                                  TextStyle(color: ColorConstants.primaryColor),
                            ),
                          )),
                          SizedBox(width: 20),
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TransaksiScreen()));
                                  },
                                  child: Text("Lihat"),
                                  style: ElevatedButton.styleFrom(
                                    primary: ColorConstants.primaryColor,
                                  ))),
                        ]),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

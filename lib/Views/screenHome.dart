import 'package:dunnostore/Widgets/CardGame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Utils/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5C4B5D),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        height: 180,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/banner/banner1.png'),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        height: 180,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/banner/banner2.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Populer',
                  style: TextStyle(
                      fontFamily: 'Lemon', fontSize: 18, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        listAllGame.length,
                        (index) => Padding(
                              padding: EdgeInsets.all(0),
                              child: CardGameWidget(
                                  data: listAllGame[index], size: 'big'),
                            )),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'All',
                  style: TextStyle(
                      fontFamily: 'Lemon', fontSize: 18, color: Colors.white),
                ),
              ),
              Container(
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 0.65,
                  children: listAllGame.map((res) {
                    return Padding(
                      padding: EdgeInsets.all(0),
                      child: CardGameWidget(data: res, size: 'small'),
                    );
                  }).toList(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

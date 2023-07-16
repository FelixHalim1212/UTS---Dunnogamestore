import 'package:dunnostore/Views/screenTopupGame.dart';
import 'package:flutter/material.dart';

import '../Utils/color_constants.dart';

class CardGameWidget extends StatelessWidget {
  final String size;
  final data;
  const CardGameWidget({super.key, this.data, required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TopupGameScreen(data: data)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: ColorConstants.primaryColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: size == 'big' ? 160 : 130,
        child: Column(
          children: [
            Container(
              height: customSizeCover(size),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.asset(
                  data['cover'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: customSizeTitle(size), horizontal: 10),
              child: Text(
                '${data['nameGame']}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size == 'big' ? 16 : 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double customSizeCover(String val) {
  if (val.toLowerCase() == 'big') {
    return 150;
  } else {
    return 100;
  }
}

double customSizeTitle(String val) {
  if (val.toLowerCase() == 'big') {
    return 30;
  } else {
    return 15;
  }
}

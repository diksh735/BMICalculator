import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'YOUR RESULT',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  )),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                cardChild: (Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('NORMAL', style: kResultTextStyle),
                    Text(
                      '22.1',
                      style: kBMITextStyle,
                    ),
                    Text(
                      'You have a normal weight . Keep Eating Good !',
                      style: kResultContentStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Color(0xFFEA1556),
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(top: 15),
                child: Center(
                  child: Text(
                    'Re-CALCULATE YOUR BMI',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'result_page.dart';

const activeColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 50;
  int age = 30;
  Color maleCardColor = activeColor;
  Color femaleCardColor = activeColor;

  void updateCard(Gender g) {
    if (g == Gender.male) {
      if (maleCardColor == activeColor) {
        maleCardColor = inactiveColor;
        femaleCardColor = activeColor;
      } else {
        maleCardColor = activeColor;
      }
    }
    if (g == Gender.female) {
      if (femaleCardColor == activeColor) {
        femaleCardColor = inactiveColor;
        maleCardColor = activeColor;
      } else {
        femaleCardColor = activeColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        elevation: 500.0,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateCard(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      cardChild: IconText(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      colour: maleCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateCard(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      cardChild: IconText(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      colour: femaleCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 15, color: Color(0xFFFFFFFF)),
                  ),
                  Text(
                    height.toString(),
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
                  ),
                  Slider(
                    max: 220,
                    min: 120,
                    activeColor: Color(0xFFEA1556),
                    inactiveColor: Color(0xFF767B8F),
                    value: height.toDouble(),
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 6),
                        Text(
                          'WEIGHT',
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFFFFFFFF)),
                        ),
                        SizedBox(height: 5),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 50),
                        ),
                        SizedBox(height: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Color(0xFF212747),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 15),
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Color(0xFF212747),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 6),
                        Text(
                          'AGE',
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFFFFFFFF)),
                        ),
                        SizedBox(height: 5),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 50),
                        ),
                        SizedBox(height: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Color(0xFF212747),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 15),
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: Color(0xFF212747),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage()),
              );
            },
            child: Container(
              color: Color(0xFFEA1556),
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              child: Center(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/round_custom_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_widget.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/bmi_brain.dart';

enum genderType { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  genderType gender;
  int height = 170;
  int age = 19;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(
                        () {
                          gender = genderType.Male;
                        },
                      );
                    },
                    colour: gender == genderType.Male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconWidget(
                        textIcon: "MALE", icon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = genderType.Female;
                      });
                    },
                    colour: gender == genderType.Female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconWidget(
                      textIcon: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                )
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "HEIGHT",
                        style: kTextStyling,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberStyling,
                        ),
                        Text(
                          "cm",
                          style: kTextStyling,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF888993),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x1fEB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        // activeColor: Color(0xFFEB1555),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kTextStyling,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberStyling,
                            ),
                            Text(
                              "Kg",
                              style: kTextStyling,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    weight++;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kTextStyling,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyling,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            BottomButton(
              buttonText: "CALCULATE",
              onPress: () {
                BMICalculation calc =
                    BMICalculation(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiNumber: calc.bmiResult(),
                      resultBMI: calc.bmiText(),
                      interpretation: calc.bmiInterpretation(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}

import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.resultBMI,
      @required this.bmiNumber,
      @required this.interpretation});
  final String resultBMI;
  final String bmiNumber;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kTitleResultStyling,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultBMI,
                    style: kResultTextStyling,
                  ),
                  Text(
                    bmiNumber,
                    style: kBMIStyling,
                  ),
                  Text(
                    interpretation,
                    style: kResultTextDescription,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: "RE-CALCULATE",
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

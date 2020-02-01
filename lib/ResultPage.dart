import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.interpretation,@required this.bmiResult,@required this.resultpageText});
  final String bmiResult;
  final String resultpageText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(child: Text('Your Result',style: titleStyle,)),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableWidget(
              colour: colorCard,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultpageText,style: resultText,),
                  Text(bmiResult,style: bmiText,),
                  Text(interpretation,textAlign: TextAlign.center,style: bodyTextStyle,)
                ],
              ),
            ),
          ),
          BottomButton(textButton: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

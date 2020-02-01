import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'ResultPage.dart';
import 'bottom_button.dart';
import 'roundIcon_button.dart';
import 'calculator_function.dart';
enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableWidget(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender==Gender.male ? colorCard : inActiveColor,
                cardWidget: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE'),
              ),
              ),
              Expanded(child: ReusableWidget(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender==Gender.female ? colorCard : inActiveColor,
                cardWidget: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE'),
              ),
              ),
            ],
          )),
          Expanded(child: ReusableWidget(
            colour: colorCard,
            cardWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style: labelTextStyle
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                  Text(
                    height.toString(),
                    style: sliderContent,
                  ),
                  Text('cm',
                  style: labelTextStyle,)
                ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98) ,
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555) ,
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child:ReusableWidget(
                colour: colorCard,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: labelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: sliderContent,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                        onPressed:(){
                          setState(() {
                            weight--;
                          });
                        },),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },),
                      ],
                    )
                  ],
                ),
              ),
              ),
              Expanded(child: ReusableWidget(
                colour: colorCard,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE',style: labelTextStyle,),
                    Text(
                      age.toString(),
                      style: sliderContent,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },),
                      ],
                    )
                  ],
                ),
              ),
              ),
            ],
          )),
          BottomButton(onTap: (){
            CalculatorFunction calc = CalculatorFunction(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultpageText: calc.getResult(),
                  interpretation: calc.getInterpretation(),);
                }
            ));
          },
            textButton: 'CALCULATE',
          )
        ],
      )
    );
  }
}









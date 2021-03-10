import 'package:flutter/material.dart';
import 'package:qwxcomponents/GUI/BorderButtonsGroupBox.dart';
import 'package:qwxcomponents/GUI/MarkedButton.dart';
import 'package:qwxcomponents/qwxcomponents.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.blue,
        primarySwatch: Colors.amber,
        textButtonTheme: TextButtonThemeData(),
      ),
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: VListView(
            children: [
              BorderButtonsGroupBox(
                children: [
                  MarkedButton(
                    icon: Icon(Icons.ac_unit),
                    onPressed: () {},
                    text: 'MarkedButton with Important',
                    textRight: 'textRight',
                    textUnder: 'textUnder',
                    importantType: MarkedButtonInfoType.Important,
                  ),
                  MarkedButton(
                    icon: Icon(Icons.family_restroom),
                    onPressed: () {},
                    text: 'MarkedButtion with Unimportant',
                    textRight: 'textRight',
                    textUnder: 'textUnder',
                    importantType: MarkedButtonInfoType.Unimportant,
                  ),
                ],
              ),
              SizedBox(height: 10),
              BorderButton(
                text: 'SINGLE BORDERBUTTON',
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FocusButton(onPressed: () {}, text: 'FocusButton'),
              SizedBox(
                height: 10,
              ),
              HeroImage(
                  frameHeight: 400,
                  url:
                      'https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png')
            ],
          ),
        ),
      ),
    );
  }
}

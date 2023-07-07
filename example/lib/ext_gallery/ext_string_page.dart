
import 'package:ex/ex.dart';
import 'package:flutter/material.dart';

class ExtStringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    10.forEach((index) {
      // do something...
    });
    return Scaffold(
      appBar: AppBar(
        title: 'Extention on String'.text.extraBold.size(16).make(),
      ),
      body: VStack(
        [
          /// 1
          ExAccordion(
            showAccordion: true,
            title: 'forEach',
            content: Container(
              height: 100,
              child: Text(
                '''
10.forEach((index) {
  // do something 10 times...
});
    ''',
              ).p8(),
            ),
          ),

          /// 2
          ExAccordion(
            showAccordion: true,
            title: 'map',
            content: Container(
              height: 100,
              child: Text(
                '''
10.map((index) {
  // do something 10 times...
});
    ''',
              ).p8(),
            ),
          ),
        ],
      ).p12().scrollVertical(),
    );
  }
}

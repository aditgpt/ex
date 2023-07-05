import 'package:ex/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../core/index.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Button'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        'Elevated'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonElevated(
            label: faker.lorem.word(),
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
          16.widthBox,
          ExButtonElevated(
            label: faker.lorem.word(),
            width: double.infinity,
            onPressed: () {},
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Elevated Disable'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonElevated(
            label: faker.lorem.word(),
          ),
          16.widthBox,
          ExButtonElevated(
            label: faker.lorem.word(),
            width: double.infinity,
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Outline'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: faker.lorem.word(),
            onPressed: () {},
          ),
          16.widthBox,
          ExButtonOutline(
            label: faker.lorem.word(),
            onPressed: () {},
            width: double.infinity,
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Outline Disable'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: faker.lorem.word(),
          ),
          16.widthBox,
          ExButtonOutline(
            label: faker.lorem.word(),
            width: double.infinity,
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Custom'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonElevated(
            backgroundColor: colorSuccess,
            child: HStack(
              [
                Icon(Icons.report_gmailerrorred_sharp, size: 18).pOnly(right: 8),
                'Elevated'.text.red200.size(12).bold.make().pOnly(right: 8),
              ],
            ),
            radius: 90,
            onPressed: () {},
          ),
          12.widthBox,
          ExButtonOutline(
            borderColor: colorSuccess,
            child: HStack(
              [
                Icon(Icons.report_gmailerrorred_sharp, size: 12).pOnly(right: 8),
                'Outline'.text.red200.size(12).bold.make().pOnly(right: 8),
              ],
            ),
            height: 32,
            radius: 90,
            onPressed: () {},
          ),
        ]).scrollHorizontal(),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Text '.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonText(
            label: 'etasdas',
            labelSize: 12,
            icon: Icon(Icons.zoom_out_outlined),
            backgroundColor: Colors.pink,
            onPressed: () {},
          ),
          16.widthBox,
          ExButtonText(
            child: faker.lorem.word().text.color(colorError).make(),
            onPressed: () {},
          ),
          16.widthBox,
        ]),
      ]).p16().scrollVertical(),
    );
  }
}

import 'package:ex/ex.dart';
import 'package:example/core/index.dart';
import 'package:example/widget_gallery/decoration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_themes.dart';
import 'ext_gallery/ext_int_page.dart';
import 'ext_gallery/ext_string_page.dart';
import 'widget_gallery/accordion_page.dart';
import 'widget_gallery/datetime_picker_page.dart';
import 'widget_gallery/listview_page.dart';
import 'widget_gallery/alert_page.dart';
import 'widget_gallery/avatar_page.dart';
import 'widget_gallery/bottomsheet_page.dart';
import 'widget_gallery/button_page.dart';
import 'widget_gallery/divider_page.dart';
import 'widget_gallery/error_or_empty_page.dart';
import 'widget_gallery/imageview_page.dart';
import 'widget_gallery/input_dialog_page.dart';
import 'widget_gallery/loading_page.dart';
import 'widget_gallery/message_page.dart';
import 'widget_gallery/progress_page.dart';
import 'widget_gallery/shimmer_page.dart';
import 'widget_gallery/snackbar_page.dart';
import 'widget_gallery/textfield_page.dart';
import 'widget_gallery/timeline_activity_page.dart';
import 'widget_gallery/typography_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: 'Ex:ample',
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: AppThemes.theme,
    ),
  );
}

class Home extends GetView {
  Home({Key? key}) : super(key: key);
  final xFeatures1 = {
    '# Typograph': TypographyPage(),
    'Accordion': AccordionPage(),
    'Message': MessagePage(),
    'Avatar': AvatarPage(),
    'Button': ButtonPage(),
    'Divider': DividerPage(),
    'ErrorOrEmpty': ErrorOrEmptyPage(),
    'ImageView': ImageViewPage(),
    'ListView': ListViewPage(),
    'Loading Page': LoadingPage(),
    'Progress': ProgressPage(),
    'Shimmer': ShimmerPage(),
    'TextField': TextFieldPage(),
    'TimeLine': TimeLineActivityPage(),
  };

  final xFeatures2 = {
    'Alert': AlertPage(),
    'Dialog Input': InputDialogPage(),
    'BottomSheet': BottomSheetPage(),
    'DateTime Picker': DateTimePage(),
    'Decorator': DecorationPage(),
    'SnackBar': SnackbarPage(),
  };

  final xFeatures3 = {
    'Int': ExtIntPage(),
    'String': ExtStringPage(),
    'List': AlertPage(),
    'Date': AlertPage(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: 'Ex:mple'.text.extraBold.size(16).make(),
          elevation: 0.5,
          bottom: TabBar(
            labelColor: colorBlack,
            unselectedLabelColor: colorNeutral[200],
            tabs: [
              'UI/Widget'.text.make().p16(),
              'Helper'.text.make().p16(),
              'Extension'.text.make().p16(),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            /// tab 1
            VStack([
              ListView.separated(
                itemCount: xFeatures1.length,
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemBuilder: (context, index) {
                  final data = xFeatures1.entries.toList();
                  return ListTile(
                    leading: Icon(Icons.folder_outlined),
                    title: data[index].key.text.make(),
                    minVerticalPadding: 2,
                    minLeadingWidth: 16,
                    onTap: () => Get.to(() => data[index].value),
                  );
                },
              ).expand(),
            ]).p24(),

            /// tab 2
            VStack([
              Divider(),
               ListTile(
                leading: Icon(Icons.folder_outlined),
                title: 'ImagePreview'.text.make(),
                minLeadingWidth: 16,
                onTap: () => ExImagePreview.show(
                  'https://asset.kompas.com/crops/7z-QN6nlfPhhYas60AA5tQXDu7Y=/0x0:1350x900/750x500/data/photo/2020/11/13/5fae5fa6b09bb.jpg',
                ),
              ),
              Divider(),
              ListView.separated(
                itemCount: xFeatures2.length,
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemBuilder: (context, index) {
                  final data = xFeatures2.entries.toList();
                  return ListTile(
                    leading: Icon(Icons.folder_outlined),
                    title: data[index].key.text.make(),
                    minVerticalPadding: 2,
                    minLeadingWidth: 16,
                    onTap: () => Get.to(() => data[index].value),
                  );
                },
              ).expand(),
            ]).p24(),

            /// tab 3
            VStack([
              ListView.separated(
                itemCount: xFeatures3.length,
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemBuilder: (context, index) {
                  final data = xFeatures3.entries.toList();
                  return ListTile(
                    leading: Icon(Icons.folder_outlined),
                    title: data[index].key.text.make(),
                    minVerticalPadding: 2,
                    minLeadingWidth: 16,
                    onTap: () => Get.to(() => data[index].value),
                  );
                },
              ).expand(),
            ]).p24(),
          ],
        ),
      ),
    );
  }
}

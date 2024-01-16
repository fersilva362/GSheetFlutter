import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_flutter/constants/routes_helper.dart';
import 'package:match_flutter/controllers/matches_soccer_controller.dart';
import 'package:match_flutter/widget/fixture_card.dart';
import 'api/dependecies_soccer.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<TotalMatchController>().getAllMatches();

    return GetBuilder<TotalMatchController>(
      builder: (controller) => GetMaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        //home: FixtureMatch(),
        initialRoute: RoutesHelper.initial,
        getPages: RoutesHelper.getPages,
      ),
    );
  }
}

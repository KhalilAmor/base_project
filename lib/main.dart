import 'package:base_project/ui/setup_bottom_sheet_ui.dart';
import 'package:base_project/ui/setup_dialog_ui.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // await Firebase.initializeApp();
  setupBottomSheetUi();
  setupDialogUi();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Base Project",
      theme: ThemeData(
          primaryColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      builder: (
        BuildContext context,
        StartUpViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.showDialog();
            },
          ),
          body: Center(
            child: Text(
              'StartupView',
            ),
          ),
        );
      },
    );
  }
}

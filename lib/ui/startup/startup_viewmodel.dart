import 'package:base_project/app/app.locator.dart';
import 'package:base_project/core/constants/app_theme.dart';
import 'package:base_project/core/constants/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  var _dialogService = locator<DialogService>();
  var _bottomSheetService = locator<BottomSheetService>();

  showDialog() {
    _dialogService.showConfirmationDialog(description: 'Hello There');
    // _bottomSheetService.showCustomSheet(
    //     variant: BottomSheetType.floating,
    //     title: 'Hello',
    //     additionalButtonTitle: 'Why not',
    //     barrierColor: primaryColor,
    //     isScrollControlled: false,
    //     mainButtonTitle: 'Confirm');
  }
}

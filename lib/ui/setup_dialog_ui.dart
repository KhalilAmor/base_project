import 'package:base_project/app/app.locator.dart';
import 'package:base_project/core/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  var dialogService = locator<DialogService>();

  var builders = {
    DialogType.Basic: (BuildContext context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        Dialog(
          child: _BasicCustomDialog(
            dialogRequest: dialogRequest,
            onDialogTap: completer,
          ),
        ),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _BasicCustomDialog extends StatelessWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _BasicCustomDialog(
      {Key? key, required this.dialogRequest, required this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            dialogRequest.title ?? 'Title',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dialogRequest.description ?? 'Description',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => onDialogTap(DialogResponse(confirmed: true)),
            child: Container(
              child: dialogRequest.showIconInMainButton ?? true
                  ? Icon(Icons.check_circle)
                  : Text(dialogRequest.mainButtonTitle ?? 'Cancel'),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

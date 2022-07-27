import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

typedef saveFunction = void Function(bool);

class saveDialog extends StatelessWidget {
  saveDialog(this.skipAndSave, this.setDateTime);
  final saveFunction skipAndSave;
  final VoidCallback setDateTime;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("alertSave".tr()),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () => skipAndSave(true),
            child: const Text("Skip & Save")),
        TextButton(onPressed: setDateTime, child: const Text("Set")),
      ],
    );
  }
}

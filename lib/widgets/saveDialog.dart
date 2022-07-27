import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class saveDialog extends StatelessWidget {
  saveDialog(this.onPressed);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(onPressed: onPressed, child: const Text("Save")),
      ],
    );
  }
}

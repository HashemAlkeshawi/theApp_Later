import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaceCreate extends StatelessWidget {
  static const String screenName = "FaceCreate";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NFPost".tr()),
      ),
    );
  }
}

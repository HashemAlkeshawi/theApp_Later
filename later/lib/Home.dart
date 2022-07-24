import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home".tr()),
      ),
    );
  }
}

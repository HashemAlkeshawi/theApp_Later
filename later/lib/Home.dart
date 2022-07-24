import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1F97CF),
        title: Text("Home".tr()),
      ),
      body: Container(
        child: Column(
          children: [Text("DSPosts".tr()), Container()],
        ),
      ),
    );
  }
}

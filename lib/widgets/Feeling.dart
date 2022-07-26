import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeelingW extends StatelessWidget {
  String emojiName;
  FeelingW({required this.emojiName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: ListTile(
        minLeadingWidth: 5,
        leading: Image.asset('assets/emojis/$emojiName.png'),
        title: Text("${"Feeling".tr()} $emojiName"),
      ),
    );
  }
}

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TwitterCreate extends StatelessWidget {
  static const String screenName = "FaceCreate";

  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00ACEE),
        title: Text("NTPost".tr()),
      ),
      body: Container(
        padding: EdgeInsets.all(12.h),
        height: screenHeight,
        child: ListView(
          children: [
            TextField(
              controller: contentController,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "TCH".tr(),
              ),
            ),
            Container(
              child: null,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          height: 100.h,
          child: Column(
            children: [
              const Divider(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/addImage.png'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/smile.png'),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff00ACEE),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        height: 60.h,
                        width: 250.w,
                        child: Center(
                          child: Text(
                            "saveTweet".tr(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ))
                ],
              )
            ],
          )),
    );
  }
}

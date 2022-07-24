import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DSPost extends StatelessWidget {
  int index;
  double screenWidth;
  DSPost(this.index, this.screenWidth);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
      width: screenWidth - 80.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all((12.0).sp),
      child: Column(
        children: [
          Image.asset('assets/images/sample.png.png'),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                child: Text("this is sample text \n Facebook content"),
              ),
              CircleAvatar(
                child: Image.asset("assets/images/facebook.png"),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DSMessages extends StatelessWidget {
  int index;
  double screenWidth;
  DSMessages(this.index, this.screenWidth);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      width: screenWidth - 80.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(97),
      ),
      padding: EdgeInsets.all((70.0).r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            child: Text("this is sample text \n Facebook content"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                child: Text("To: xxx-xxxxxxxxx"),
              ),
              CircleAvatar(
                child: Image.asset("assets/images/whatsapp.png"),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/posts/facebook/F_Post.dart';

class FaceCreate extends StatelessWidget {
  static const String screenName = "FaceCreate";

  TextEditingController contentController = TextEditingController();
  Feeling? feeling;

  getImage() async {
    File? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(file!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4267B2),
        title: Text("NFPost".tr()),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.done,
                size: 40.h,
              ))
        ],
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
                  hintText: "FCH".tr(),
                ),
              ),
              Container(
                child: null,
              ),
            ],
          )),
      bottomNavigationBar: SizedBox(
          height: 200.h,
          child: Column(
            children: [
              const Divider(),
              ListTile(
                leading: Image.asset("assets/images/add_photo.png"),
                title: Text("Photo".tr()),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset("assets/images/feeling.png"),
                title: Text("Feeling".tr()),
              )
            ],
          )),
    );
  }
}

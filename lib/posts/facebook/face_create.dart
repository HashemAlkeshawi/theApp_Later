import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:later/DataStorage/DB_Helper.dart';
import 'package:later/DataStorage/Temp.dart';
import 'package:later/posts/facebook/F_Post.dart';
import 'package:path_provider/path_provider.dart';

import '../../widgets/Feeling.dart';
import '../../widgets/saveDialog.dart';

typedef VoidCallback refreshFunction();

class FaceCreate extends StatefulWidget {
  static const String screenName = "FaceCreate";

  @override
  State<FaceCreate> createState() => _FaceCreateState();
}

class _FaceCreateState extends State<FaceCreate> {
  TextEditingController contentController = TextEditingController();
  String? selectedFeeling;
  String? imagePath;
  DateTime? dueOn;
  bool isTimed = false;

  File? selectedImage;

  getImage() async {
    bool? isCamera = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("Camera"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("gallery "),
            ),
          ],
        ),
      ),
    );
    XFile? file = await ImagePicker().pickImage(
        source: isCamera! ? ImageSource.camera : ImageSource.gallery);
    selectedImage = File(file!.path);
    setState(() {});
  }

  void dateTimePicker() {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime(2023, 12, 31),
        onChanged: (v) {}, onConfirm: (date) {
      dueOn = date;
      isTimed = true;
      savePost(false);
      print(dueOn);
      Navigator.pop(context);
      Navigator.pop(context);
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  void savePost(bool pop) async {
    final Directory path = await getApplicationDocumentsDirectory();
    String appPath = path.path;
    if (selectedImage != null) {
      String imageFileType =
          selectedImage!.path.substring(selectedImage!.path.length - 4);

      final File ImageFile =
          await selectedImage!.copy('$appPath/${DateTime.now()}$imageFileType');

      imagePath = ImageFile.path;
    }

    print(imagePath);

    F_Post post = F_Post(
        type: 1,
        content: contentController.text,
        creationTime: DateTime.now(),
        imagePath: imagePath == null ? '' : imagePath!,
        dueOn: dueOn,
        isTimed: isTimed,
        feeling: selectedFeeling);

    DbHelper.dbHelper.fInsertNewPost(post);
    listOfPost();
    if (pop) {
      listOfPost();
      Navigator.pop(context);
      Navigator.pop(context);
    }
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
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => saveDialog(savePost, dateTimePicker));
              },
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
              FeelingW(
                emojiName: selectedFeeling,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                child: TextField(
                  controller: contentController,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "FCH".tr(),
                  ),
                ),
              ),
              Container(
                child: selectImage(selectedImage),
              ),
            ],
          )),
      bottomNavigationBar: SizedBox(
          height: 200.h,
          child: Column(
            children: [
              const Divider(),
              ListTile(
                onTap: () {
                  getImage();
                },
                leading: Image.asset("assets/images/add_photo.png"),
                title: Text("Photo".tr()),
              ),
              const Divider(),
              DropdownButton<String>(
                  hint: ListTile(
                    title: Text("Feeling".tr()),
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset('assets/images/feeling.png'),
                    ),
                  ),
                  isExpanded: true,
                  underline: SizedBox(),
                  value: selectedFeeling,
                  items: (Feeling.toList()).map((e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: ListTile(
                        title: Text(e),
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset('assets/emojis/$e.png'),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (v) {
                    selectedFeeling = v;
                    setState(() {});
                  }),
            ],
          )),
    );
  }
}

selectImage(File? image) {
  Widget? widget;
  image == null
      ? widget = const SizedBox()
      : widget = Image.file(
          image,
          fit: BoxFit.contain,
        );
  return widget;
}

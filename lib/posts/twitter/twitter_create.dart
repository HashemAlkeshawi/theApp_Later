import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../DataStorage/DB_Helper.dart';
import '../../DataStorage/Temp.dart';
import '../../widgets/saveDialog.dart';
import '../instagram/I_post.dart';
import 'T_post.dart';

class TwitterCreate extends StatefulWidget {
  static const String screenName = "FaceCreate";

  @override
  State<TwitterCreate> createState() => _TwitterCreateState();
}

class _TwitterCreateState extends State<TwitterCreate> {
  TextEditingController contentController = TextEditingController();

  String? selectedFeeling;
  String? imagePath;
  DateTime? dueOn;
  bool isTimed = false;

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

    T_Post post = T_Post(
      type: 3,
      content: contentController.text,
      creationTime: DateTime.now(),
      imagePath: imagePath == null ? '' : imagePath!,
      dueOn: dueOn,
      isTimed: isTimed,
    );

    DbHelper.dbHelper.tInsertNewPost(post);
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
    ////////////
    FocusNode inputNode = FocusNode();
    void openKeyboard() {
      FocusScope.of(context).requestFocus(inputNode);
    }

////////////
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
              keyboardType: TextInputType.values[0],
              focusNode: inputNode,
              controller: contentController,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "TCH".tr(),
              ),
            ),
            Container(
              child: selectImage(selectedImage),
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
                    onPressed: () {
                      getImage();
                    },
                    icon: Image.asset('assets/images/addImage.png'),
                  ),
                  IconButton(
                    onPressed: () {
                      openKeyboard();
                    },
                    icon: Image.asset('assets/images/smile.png'),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                saveDialog(savePost, dateTimePicker));
                      },
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

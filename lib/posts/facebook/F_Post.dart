import 'dart:io';

class F_Post {
  String? content;
  DateTime? creationDate;
  Feeling? feeling;
  File? image;
  DateTime? dueOn;

  F_Post(
      {this.content, this.creationDate, this.feeling, this.image, this.dueOn});
}

class Feeling {
  static const String happy = "happy";
  static const String loved = "loved";
  static const String angry = "angry";
  static const String excited = "excited";
  static const String crazy = "crazy";
  static const String blessed = "blessed";
  static const String sad = "sad";
  static const String thankful = "thankful";
  static const String grateful = "grateful";
  static const String embarrassed = "embarrassed";
  static const String alone = "alone";
  static const String awesome = "awesome";
  static const String creative = "creative";
  static const String annoyed = "annoyed";
  static const String tired = "tired";
}

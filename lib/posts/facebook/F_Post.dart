import 'package:later/DataStorage/DB_Helper.dart';

class F_Post {
  int? id;
  String? content;
  DateTime? creationTime;
  DateTime? dueOn;
  String? imagePath;
  bool isTimed = false;
  late int type;
  String? feeling;

  F_Post(
      {this.content,
      this.creationTime,
      this.feeling,
      this.imagePath,
      this.dueOn,
      this.isTimed = false,
      required this.type});

  F_Post.fromMap(Map<String, dynamic> map) {
    id = map[PostsTable.idColumName];
    content = map[PostsTable.contentColumName];
    creationTime = DateTime.tryParse(map[PostsTable.creationTimeColumName]);
    dueOn = DateTime.tryParse(map[PostsTable.dueOnColumName]);
    imagePath = map[PostsTable.imagePathColumName];
    isTimed = map[PostsTable.isTimedColumName] == 1 ? true : false;
    type = map[PostsTable.typeColumName];
    feeling = map[PostsTable.feelingColumName];
  }

  toMap() {
    Map<String, dynamic> postInMap = {
      PostsTable.contentColumName: content,
      PostsTable.creationTimeColumName: creationTime.toString(),
      PostsTable.dueOnColumName: dueOn.toString(),
      PostsTable.imagePathColumName: imagePath,
      PostsTable.isTimedColumName: isTimed ? 1 : 0,
      PostsTable.typeColumName: type,
      PostsTable.feelingColumName: feeling
    };
    return postInMap;
  }

  String stillTime() {
    Duration duration = dueOn!.difference(DateTime.now());

    int days = duration.inDays;
    int hours = duration.inHours - (days * 24);
    int minutes = duration.inMinutes - ((days * 24 + hours) * 60);

    String stellInDateTime = '${days}d, ${hours}h, ${minutes}m';

    return stellInDateTime;
  }

  String typeImage() {
    switch (type) {
      case 1:
        return 'assets/images/facebook.png';
      case 2:
        return 'assets/images/instagram.png';
      case 3:
        return 'assets/images/twitter.png';
    }
    return 'assets/images/facebook.png';
  }
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
  static const String cool = "cool";
  static const String relaxed = "relaxed";
  static const String sick = "sick";
  static const String sleepy = "sleepy";

  static List<String> toList() {
    return [
      happy,
      loved,
      angry,
      excited,
      crazy,
      blessed,
      sad,
      thankful,
      grateful,
      embarrassed,
      alone,
      awesome,
      creative,
      annoyed,
      tired,
      cool,
      relaxed,
      sick,
      sleepy
    ];
  }
}

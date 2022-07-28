import 'package:later/DataStorage/DB_Helper.dart';

class Messages_ {
  int? id;
  String? content;
  DateTime? creationTime;
  DateTime? dueOn;
  bool isTimed = false;
  late int type;

  Messages_(
      {this.content,
      this.creationTime,
      this.dueOn,
      this.isTimed = false,
      required this.type});

  Messages_.fromMap(Map<String, dynamic> map) {
    id = map[PostsTable.idColumName];
    content = map[PostsTable.contentColumName];
    creationTime = DateTime.tryParse(map[PostsTable.creationTimeColumName]);
    dueOn = DateTime.tryParse(map[PostsTable.dueOnColumName]);
    isTimed = map[PostsTable.isTimedColumName] == 1 ? true : false;
    type = map[PostsTable.typeColumName];
  }

  toMap() {
    Map<String, dynamic> postInMap = {
      PostsTable.contentColumName: content,
      PostsTable.creationTimeColumName: creationTime.toString(),
      PostsTable.dueOnColumName: dueOn.toString(),
      PostsTable.isTimedColumName: isTimed ? 1 : 0,
      PostsTable.typeColumName: type
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

  String typeImage(Messages_ m) {
    switch (m.type) {
      case 1:
        return 'assets/images/facebook.png';
      case 2:
        return 'assets/images/facebook.png';
      case 3:
        return 'assets/images/facebook.png';
    }
    return '';
  }
}

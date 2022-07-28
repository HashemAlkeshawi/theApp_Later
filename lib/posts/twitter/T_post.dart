import '../../DataStorage/DB_Helper.dart';

class T_Post {
  int? id;
  String? content;
  DateTime? creationTime;
  DateTime? dueOn;
  String? imagePath;
  bool isTimed = false;
  late int type;

  T_Post(
      {this.content,
      this.creationTime,
      this.imagePath,
      this.dueOn,
      this.isTimed = false,
      required this.type});

  T_Post.fromMap(Map<String, dynamic> map) {
    id = map[PostsTable.idColumName];
    content = map[PostsTable.contentColumName];
    creationTime = DateTime.tryParse(map[PostsTable.creationTimeColumName]);
    dueOn = DateTime.tryParse(map[PostsTable.dueOnColumName]);
    imagePath = map[PostsTable.imagePathColumName];
    isTimed = map[PostsTable.isTimedColumName] == 1 ? true : false;
    type = map[PostsTable.typeColumName];
  }

  toMap() {
    Map<String, dynamic> postInMap = {
      PostsTable.contentColumName: content,
      PostsTable.creationTimeColumName: creationTime.toString(),
      PostsTable.dueOnColumName: dueOn.toString(),
      PostsTable.imagePathColumName: imagePath,
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

  String typeImage() {
    return 'assets/images/twitter.png';
  }
}

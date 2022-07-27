import '../DataStorage/DB_Helper.dart';

class MessageMaster {
  String? id;
  String? content;
  DateTime? creationTime;
  DateTime? dueOn;
  String? to;
  bool isTimed = false;

  MessageMaster(
      {this.content,
      this.creationTime,
      this.to,
      this.dueOn,
      this.isTimed = false});

  MessageMaster.fromMap(Map<String, dynamic> map) {
    id = map[MessagesTable.idColumName];
    content = map[MessagesTable.contentColumName];
    creationTime = map[MessagesTable.creationTimeColumName];
    dueOn = map[MessagesTable.dueOnColumName];
    to = map[MessagesTable.toColumnName];
    isTimed = map[MessagesTable.isTimedColumName] == 1 ? true : false;
  }

  toMap() {
    Map<String, dynamic> messagesInMap = {
      MessagesTable.contentColumName: content,
      MessagesTable.creationTimeColumName: creationTime,
      MessagesTable.dueOnColumName: dueOn,
      MessagesTable.toColumnName: to,
      MessagesTable.isTimedColumName: isTimed ? 1 : 0
    };
    return messagesInMap;
  }

  String stillTime() {
    Duration duration = this.dueOn!.difference(DateTime.now());

    int days = duration.inDays;
    int hours = duration.inHours - (days * 24);
    int minutes = duration.inMinutes - ((days * 24 + hours) * 60);

    String stellInDateTime = '${days}d, ${hours}h, ${minutes}m';

    return stellInDateTime;
  }
}

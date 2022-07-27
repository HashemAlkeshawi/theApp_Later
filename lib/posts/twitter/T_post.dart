import 'package:later/posts/PostArchiticture.dart';

class T_Post extends PostMaster {
  T_Post({
    required super.type,
    super.content,
    super.creationTime,
    super.imagePath,
    super.dueOn,
    super.isTimed,
  });
}

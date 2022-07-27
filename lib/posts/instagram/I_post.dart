import 'package:later/posts/PostArchiticture.dart';

class I_Post extends PostMaster {
  I_Post({
    required super.type,
    super.content,
    super.creationTime,
    required super.imagePath,
    super.dueOn,
    super.isTimed,
  });
}

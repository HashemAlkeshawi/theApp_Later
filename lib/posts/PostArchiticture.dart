import 'package:later/posts/facebook/F_Post.dart';
import 'package:later/posts/instagram/I_post.dart';

class PostMaster {
  String? content;
  DateTime? creationTime;
  DateTime? dueOn;
  String? imagePath;
  bool isTimed = false;

  PostMaster(
      {this.content,
      this.creationTime,
      this.imagePath,
      this.dueOn,
      this.isTimed = false});

  String StillTime() {
    Duration duration = this.dueOn!.difference(DateTime.now());

    int days = duration.inDays;
    int hours = duration.inHours - (days * 24);
    int minutes = duration.inMinutes - ((days * 24 + hours) * 60);

    String stellInDateTime = '${days}d, ${hours}h, ${minutes}m';

    return stellInDateTime;
  }

  String typeImage() {
    String imageName = this.runtimeType == F_Post
        ? 'facebook'
        : this.runtimeType == I_Post
            ? 'instagram'
            : 'twitter';

    return 'assets/images/$imageName.png';
  }
}

import 'package:later/posts/facebook/F_Post.dart';

import '../posts/PostArchiticture.dart';

F_Post fSample1 = F_Post(
    content: 'First is the contentof tis is the content',
    creationTime: DateTime.now(),
    feeling: Feeling.crazy,
    imagePath: 'assets/images/sample.png.png');

F_Post fSample2 = F_Post(
    content: 'Second is the content of this is the content',
    creationTime: DateTime.now(),
    feeling: Feeling.crazy,
    imagePath: 'assets/images/facebook.png');

List<PostMaster> listOfPosts = [fSample1, fSample2];

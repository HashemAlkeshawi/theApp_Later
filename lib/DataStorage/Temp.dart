import 'package:later/posts/facebook/F_Post.dart';

import '../posts/PostArchiticture.dart';
import '../posts/instagram/I_post.dart';
import '../posts/twitter/T_post.dart';

F_Post fSample1 = F_Post(
    content: 'First is the contentof tis is the content',
    creationTime: DateTime.now(),
    feeling: Feeling.crazy,
    imagePath: 'assets/images/sample.png.png');

T_Post fSample2 = T_Post(
    content: 'Second is the content of this is the content',
    creationTime: DateTime.now(),
    imagePath: 'assets/images/facebook.png');
F_Post fSample3 = F_Post(
    content: 'Second is the content of this is the content',
    creationTime: DateTime.now(),
    feeling: Feeling.crazy,
    imagePath: 'assets/images/facebook.png');
I_Post fSample4 = I_Post(
    content: 'Second is the content of this is the content',
    creationTime: DateTime.now(),
    imagePath: 'assets/images/facebook.png');
F_Post fSample5 = F_Post(
    content: 'Second is the content of this is the content',
    creationTime: DateTime.now(),
    feeling: Feeling.crazy,
    imagePath: 'assets/images/facebook.png');

List<PostMaster> listOfPosts = [
  fSample1,
  fSample2,
  fSample3,
  fSample4,
  fSample5
];

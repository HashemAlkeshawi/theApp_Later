import 'package:later/DataStorage/DB_Helper.dart';
import 'package:later/posts/facebook/F_Post.dart';

import '../posts/PostArchiticture.dart';
import '../posts/instagram/I_post.dart';
import '../posts/twitter/T_post.dart';

F_Post fSample1 = F_Post(
    isTimed: true,
    dueOn: DateTime(2022, 7, 29, 8, 30),
    content: 'First is the contentof tis is the content',
    creationTime: DateTime.now(),
    feeling: Feeling.cool,
    imagePath: 'assets/images/sample.png.png');

T_Post fSample2 = T_Post(
    isTimed: true,
    dueOn: DateTime(2022, 7, 29, 8, 30),
    content: 'Second is the content of this is the content',
    creationTime: DateTime.now(),
    imagePath: 'assets/images/addImage.png');
F_Post fSample3 = F_Post(
    content: 'Second is the content of this is the content',
    creationTime: DateTime.now(),
    feeling: Feeling.angry,
    imagePath: 'assets/images/Messages_.png');
I_Post fSample4 = I_Post(
    content: 'Second is the content of this is the content',
    creationTime: DateTime.now(),
    imagePath: 'assets/images/twitter.png');
F_Post fSample5 = F_Post(
    content: 'Second is the content of this is the content',
    creationTime: DateTime.now(),
    feeling: Feeling.creative,
    imagePath: 'assets/images/facebook.png');

Future<List<PostMaster>> listOfPosts() async {
  List<PostMaster> listOfPosts = await DbHelper.dbHelper.selectAllPosts();
  return listOfPosts;
}

//  = [
//   fSample1,
//   fSample2,
//   fSample3,
//   fSample4,
//   fSample5
// ];

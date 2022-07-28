import 'package:later/DataStorage/DB_Helper.dart';

// F_Post fSample1 = F_Post(
//     isTimed: true,
//     dueOn: DateTime(2022, 7, 29, 8, 30),
//     content: 'First is the contentof tis is the content',
//     creationTime: DateTime.now(),
//     feeling: Feeling.cool,
//     imagePath: 'assets/images/sample.png.png');

// T_Post fSample2 = T_Post(
//     isTimed: true,
//     dueOn: DateTime(2022, 7, 29, 8, 30),
//     content: 'Second is the content of this is the content',
//     creationTime: DateTime.now(),
//     imagePath: 'assets/images/addImage.png');
// F_Post fSample3 = F_Post(
//     content: 'Second is the content of this is the content',
//     creationTime: DateTime.now(),
//     feeling: Feeling.angry,
//     imagePath: 'assets/images/Messages_.png');
// I_Post fSample4 = I_Post(
//     content: 'Second is the content of this is the content',
//     creationTime: DateTime.now(),
//     imagePath: 'assets/images/twitter.png');
// F_Post fSample5 = F_Post(
//     content: 'Second is the content of this is the content',
//     creationTime: DateTime.now(),
//     feeling: Feeling.creative,
//     imagePath: 'assets/images/facebook.png');

List<dynamic> ListOfPosts = [];

listOfPost() async {
  List<dynamic> listOfPosts = await DbHelper.dbHelper.fSelectAllPosts();
  List<dynamic> listOfPosts2 = await DbHelper.dbHelper.ISelectAllPosts();
  List<dynamic> listOfPosts3 = await DbHelper.dbHelper.TSelectAllPosts();
  ListOfPosts.clear();
  ListOfPosts.addAll(listOfPosts);
  ListOfPosts.addAll(listOfPosts2);
  ListOfPosts.addAll(listOfPosts3);

  ListOfPosts.sort(
    (a, b) {
      return b.creationTime!.compareTo(a.creationTime!);
    },
  );
}

//  = [
//   fSample1,
//   fSample2,
//   fSample3,
//   fSample4,
//   fSample5
// ];

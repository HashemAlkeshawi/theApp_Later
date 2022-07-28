import 'package:later/posts/facebook/F_Post.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../messages/Message.dart';
import '../posts/instagram/I_post.dart';
import '../posts/twitter/T_post.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();

  Database? database;
  initDatabase() async {
    database = await createConnectionWithDatabase();
  }

  Future<Database> createConnectionWithDatabase() async {
    String databasePath = await getDatabasesPath();
    String databaseName = 'later.db';
    String fullPath = join(databasePath, databaseName);
    Database database =
        await openDatabase(fullPath, version: 1, onCreate: (db, i) {
      print('hello, the database has been created');

      db.execute('''
 CREATE TABLE ${PostsTable.postsTableName} (
  ${PostsTable.idColumName} INTEGER PRIMARY KEY AUTOINCREMENT,
  ${PostsTable.contentColumName} TEXT,
  ${PostsTable.creationTimeColumName} TEXT,
  ${PostsTable.dueOnColumName} TEXT,
  ${PostsTable.imagePathColumName} TEXT,
  ${PostsTable.isTimedColumName} INTEGER,
  ${PostsTable.feelingColumName} TEXT,
  ${PostsTable.typeColumName} INTEGER
  )
''');
      db.execute('''
 CREATE TABLE ${MessagesTable.postsTableName} (
  ${MessagesTable.idColumName} INTEGER PRIMARY KEY AUTOINCREMENT,
  ${MessagesTable.contentColumName} TEXT,
  ${MessagesTable.creationTimeColumName} TEXT,
  ${MessagesTable.dueOnColumName} TEXT,
  ${MessagesTable.toColumnName} TEXT,
  ${MessagesTable.isTimedColumName} INTEGER,
  ${MessagesTable.typeColumName} INTEGER
  )
''');
    }, onOpen: (db) async {
      final tables =
          await db.rawQuery('SELECT name FROM sqlite_master ORDER BY name;');
      print(tables.toString());
    });
    return database;
  }

  // POSTS CRUID ---------------------------------------

  fInsertNewPost(F_Post post) async {
    int rowIndex =
        await database!.insert(PostsTable.postsTableName, post.toMap());
    print(rowIndex.toString());
  }

  iInsertNewPost(I_Post post) async {
    int rowIndex =
        await database!.insert(PostsTable.postsTableName, post.toMap());
    print(rowIndex.toString());
  }

  tInsertNewPost(T_Post post) async {
    int rowIndex =
        await database!.insert(PostsTable.postsTableName, post.toMap());
    print(rowIndex.toString());
  }

  Future<List<F_Post>> fSelectAllPosts() async {
    List<Map<String, Object?>> rowsAsMaps = await database!.query(
        PostsTable.postsTableName,
        where: '${PostsTable.typeColumName}=?',
        whereArgs: [1]);
    List<F_Post> posts = rowsAsMaps.map((e) => F_Post.fromMap(e)).toList();
    return posts;
  }

  Future<List<I_Post>> ISelectAllPosts() async {
    List<Map<String, Object?>> rowsAsMaps = await database!.query(
        PostsTable.postsTableName,
        where: '${PostsTable.typeColumName}=?',
        whereArgs: [2]);
    List<I_Post> posts = rowsAsMaps.map((e) => I_Post.fromMap(e)).toList();
    return posts;
  }

  Future<List<T_Post>> TSelectAllPosts() async {
    List<Map<String, Object?>> rowsAsMaps = await database!.query(
        PostsTable.postsTableName,
        where: '${PostsTable.typeColumName}=?',
        whereArgs: [3]);
    List<T_Post> posts = rowsAsMaps.map((e) => T_Post.fromMap(e)).toList();
    return posts;
  }

  fSelectOnePost(int id) {
    database!.query(PostsTable.postsTableName,
        where: '${PostsTable.idColumName}=?', whereArgs: [id]);
  }

  ISelectOnePost(int id) {
    database!.query(PostsTable.postsTableName,
        where: '${PostsTable.idColumName}=?', whereArgs: [id]);
  }

  TSelectOnePost(int id) {
    database!.query(PostsTable.postsTableName,
        where: '${PostsTable.idColumName}=?', whereArgs: [id]);
  }

  fUpdateOnePost(F_Post post) async {
    int count = await database!.update(PostsTable.idColumName, post.toMap(),
        where: '${PostsTable.idColumName}=?', whereArgs: [post.id]);
    print(count.toString());
  }

  IUpdateOnePost(I_Post post) async {
    int count = await database!.update(PostsTable.idColumName, post.toMap(),
        where: '${PostsTable.idColumName}=?', whereArgs: [post.id]);
    print(count.toString());
  }

  UpdateOnePost(T_Post post) async {
    int count = await database!.update(PostsTable.idColumName, post.toMap(),
        where: '${PostsTable.idColumName}=?', whereArgs: [post.id]);
    print(count.toString());
  }

  deleteOnePost(int id) {
    database!.delete(PostsTable.postsTableName,
        where: '${PostsTable.idColumName}=?', whereArgs: [id]);
  }
  //--------------------------------------------------
  // POSTS CRUID ---------------------------------------

  insertNewMessage(Messages_ post) async {
    int rowIndex =
        await database!.insert(PostsTable.postsTableName, post.toMap());
    print(rowIndex.toString());
  }

  Future<List<Messages_>> selectAllMessagess() async {
    List<Map<String, Object?>> rowsAsMaps =
        await database!.query(PostsTable.postsTableName);
    List<Messages_> posts =
        rowsAsMaps.map((e) => Messages_.fromMap(e)).toList();
    return posts;
  }

  selectOneMessage(int id) {
    database!.query(PostsTable.postsTableName,
        where: '${PostsTable.idColumName}=?', whereArgs: [id]);
  }

  updateOneMessage(Messages_ post) async {
    int count = await database!.update(PostsTable.idColumName, post.toMap(),
        where: '${PostsTable.idColumName}=?', whereArgs: [post.id]);
    print(count.toString());
  }

  deleteOneMessage(int id) {
    database!.delete(PostsTable.postsTableName,
        where: '${PostsTable.idColumName}=?', whereArgs: [id]);
  }
  //--------------------------------------------------

}

class PostsTable {
  static const String postsTableName = 'posts';
  static const String idColumName = 'id';
  static const String contentColumName = 'content';
  static const String creationTimeColumName = 'creationTime';
  static const String dueOnColumName = 'dueOn';
  static const String imagePathColumName = 'imagePath';
  static const String isTimedColumName = 'isTimed';
  static const String feelingColumName = 'feeling';
  static const String typeColumName = 'type';
}

class MessagesTable {
  static const String postsTableName = 'messages';
  static const String idColumName = 'id';
  static const String contentColumName = 'content';
  static const String creationTimeColumName = 'creationTime';
  static const String dueOnColumName = 'dueOn';
  static const String toColumnName = 'toWhom';
  static const String isTimedColumName = 'isTimed';
  static const String typeColumName = 'type';
}

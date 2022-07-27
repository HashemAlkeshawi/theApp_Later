import 'package:later/posts/PostArchiticture.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
  ${PostsTable.feelingColumName} TEXT
  )
''');
      db.execute('''
 CREATE TABLE ${MessagesTable.postsTableName} (
  ${MessagesTable.idColumName} INTEGER PRIMARY KEY AUTOINCREMENT,
  ${MessagesTable.contentColumName} TEXT,
  ${MessagesTable.creationTimeColumName} TEXT,
  ${MessagesTable.dueOnColumName} TEXT,
  ${MessagesTable.toColumnName} TEXT,
  ${MessagesTable.isTimedColumName} INTEGER
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

  insertNewPost(PostMaster post) async {
    int rowIndex =
        await database!.insert(PostsTable.postsTableName, post.toMap());
    print(rowIndex.toString());
  }

  Future<List<PostMaster>> selectAllPosts() async {
    List<Map<String, Object?>> rowsAsMaps =
        await database!.query(PostsTable.postsTableName);
    List<PostMaster> posts =
        rowsAsMaps.map((e) => PostMaster.fromMap(e)).toList();
    return posts;
  }

  selectOnePost(int id) {
    database!.query(PostsTable.postsTableName,
        where: '${PostsTable.idColumName}=?', whereArgs: [id]);
  }

  updateOnePost(PostMaster post) async {
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

  insertNewMessage(PostMaster post) async {
    int rowIndex =
        await database!.insert(PostsTable.postsTableName, post.toMap());
    print(rowIndex.toString());
  }

  Future<List<PostMaster>> selectAllMessagess() async {
    List<Map<String, Object?>> rowsAsMaps =
        await database!.query(PostsTable.postsTableName);
    List<PostMaster> posts =
        rowsAsMaps.map((e) => PostMaster.fromMap(e)).toList();
    return posts;
  }

  selectOneMessage(int id) {
    database!.query(PostsTable.postsTableName,
        where: '${PostsTable.idColumName}=?', whereArgs: [id]);
  }

  updateOneMessage(PostMaster post) async {
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
}

class MessagesTable {
  static const String postsTableName = 'messages';
  static const String idColumName = 'id';
  static const String contentColumName = 'content';
  static const String creationTimeColumName = 'creationTime';
  static const String dueOnColumName = 'dueOn';
  static const String toColumnName = 'toWhom';
  static const String isTimedColumName = 'isTimed';
}

import 'package:mongo_dart/mongo_dart.dart';

class MongoDBService {
  static late Db db;
  static late DbCollection usersCollection;
  static late DbCollection drillsCollection;

  static Future<void> connect() async {
    final password = Uri.encodeComponent('Suyash12');
    final username = Uri.encodeComponent('SuyashFriend');
    try {
      // Use Db.create to support SRV URIs
      db = await Db.create(
          'mongodb+srv://$username:$password@suyash.ev7vn.mongodb.net/test?retryWrites=true&w=majority');

      print('Connecting to MongoDB...');

      // Open the connection to the database
      await db.open();
      usersCollection = db.collection('users');
      drillsCollection = db.collection('drills');

      print('MongoDB Connected!');
    } catch (e) {
      print('Error connecting to MongoDB: $e');
    }
  }

  static Future<void> close() async {
    await db.close();
    print('MongoDB connection closed.');
  }
}

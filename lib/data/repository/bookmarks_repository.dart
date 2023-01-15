import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app_project/data/models/google_books/google_book.dart';
import 'package:mobile_app_project/data/repository/user_data_cache.dart';
import 'package:mobile_app_project/utils/constants/firestore_fields.dart';

class BookmarksRepository {
  BookmarksRepository({
    UserDataCache? userDataCache,
    FirebaseFirestore? fireStore,
  })  : _userDataCache = userDataCache ?? UserDataCache(),
        _fireStore = fireStore ?? FirebaseFirestore.instance;

  final UserDataCache _userDataCache;
  final FirebaseFirestore _fireStore;

  Future<void> recordMyBookMark(GoogleBook book) async {
    final userID = _userDataCache.readUserDataCachePreferences().id;

    try {
      final isExist = await isAlreadyRecordedInMyBookmarks(book.id);
      if (!isExist) {
        await _fireStore
            .collection(kUsersCollectionName)
            .doc(userID)
            .collection(kMyBookMMarksSubCollectionName)
            .doc(book.id)
            .set(book.toJson());
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> isAlreadyRecordedInMyBookmarks(String id) async {
    final userID = _userDataCache.readUserDataCachePreferences().id;
    if (id.isNotEmpty) {
      try {
        final snapshot = await _fireStore
            .collection(kUsersCollectionName)
            .doc(userID)
            .collection(kMyBookMMarksSubCollectionName)
            .doc(id)
            .get();
        return snapshot.exists;
      } catch (error) {
        rethrow;
      }
    }
    return false;
  }

  Future<void> deleteMyBookMark(String bookID) async {
    final userID = _userDataCache.readUserDataCachePreferences().id;
    try {
      await _fireStore
          .collection(kUsersCollectionName)
          .doc(userID)
          .collection(kMyBookMMarksSubCollectionName)
          .doc(bookID)
          .delete();
    } catch (error) {
      rethrow;
    }
  }
}

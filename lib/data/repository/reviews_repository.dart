import 'package:cloud_firestore/cloud_firestore.dart';
import '../../helper/exceptions.dart';
import '../../utils/constants/firestore_fields.dart';
import '../models/google_books/google_book.dart';
import '../models/user_review.dart';
import 'user_data_cache.dart';

class ReviewRepository {
  ReviewRepository({
    UserDataCache? userDataCache,
    FirebaseFirestore? fireStore,
  })  : _userDataCache = userDataCache ?? UserDataCache(),
        _fireStore = fireStore ?? FirebaseFirestore.instance;

  final UserDataCache _userDataCache;
  final FirebaseFirestore _fireStore;

  Future<void> submitUserReview(
      {required String review, required GoogleBook googleBook}) async {
    final currentUser = _userDataCache.readUserDataCachePreferences();
    if (currentUser.isAuthenticated) {
      try {
        await _fireStore.collection(kReviewedBooksCollectionName)
            .doc(googleBook.id).set(googleBook.toJson());
        await _fireStore
            .collection(kReviewedBooksCollectionName)
            .doc(googleBook.id)
            .collection(kReviewsSubCollection)
            .doc(currentUser.id)
            .set({
          kUserNameField: currentUser.name ?? '',
          kUserImageLink: currentUser.profilePicturePath ?? '',
          kReviewTextField: review
        });
      } catch (error) {
        rethrow;
      }
    } else {
      throw FirebaseAuthFailure();
    }
  }

  Future<bool> _isReviewedBookExists({required String bookId}) async {
    final document = await _fireStore
        .collection(kReviewedBooksCollectionName)
        .doc(bookId)
        .get();
    return document.exists;
  }

  Future<String> getCurrentUserBookReview({required String bookId}) async {
    final currentUser = _userDataCache.readUserDataCachePreferences();
    if (currentUser.isAuthenticated) {
      try {
        final bool isBookDocumentExist =
            await _isReviewedBookExists(bookId: bookId);
        if (isBookDocumentExist) {
          final userReviewDocument = await _fireStore
              .collection(kReviewedBooksCollectionName)
              .doc(bookId)
              .collection(kReviewsSubCollection)
              .doc(currentUser.id)
              .get();
          if (userReviewDocument.exists &&
              userReviewDocument.data()?[kReviewTextField] != null) {
            return userReviewDocument.data()![kReviewTextField];
          } else {
            return kEmpty;
          }
        } else {
          return kEmpty;
        }
      } catch (error) {
        rethrow;
      }
    } else {
      throw FirebaseAuthFailure();
    }
  }

  Future<List<UserReview>> getBookReviews({required String bookId}) async {
    try {
      final bool isBookDocumentExist = await _isReviewedBookExists(bookId: bookId);
      if (isBookDocumentExist) {
        final booksReviewsDocuments = await _fireStore
            .collection(kReviewedBooksCollectionName)
            .doc(bookId)
            .collection(kReviewsSubCollection)
            .get();
        List<UserReview> usersReviews = [];
        booksReviewsDocuments.docs.forEach((document) {
          usersReviews.add(UserReview.fromJson(document.data()));
        });
        return usersReviews;
      } else {
        return [];
      }
    } catch (error) {
      rethrow;
    }
  }
}
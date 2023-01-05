import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils/constants/firestore_fields.dart';
import '../models/user.dart';

class UserRepository {
  UserRepository({FirebaseFirestore? firebaseFirestore})
      : _fireStore = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _fireStore;

  void saveFireStoreUser(User user){
    if(user.isAuthenticated) {
      _fireStore.collection(kUsersCollectionName).doc(user.id)
          .set({kUserNameField:user.name ?? "",kUserEmailField:user.email});
    }
  }
}

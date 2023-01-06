import 'package:equatable/equatable.dart';
import '../../utils/constants/cache_keys.dart';

class User extends Equatable{
  @override
  List<Object?> get props => [id];

  final String? name;
  final String? email;
  final String? profilePicturePath;
  final String id;

  const User({required this.id,
          this.name,
          this.email,
          this.profilePicturePath});

  static const empty = User(id: '');

  bool get isAuthenticated => this != User.empty;
  bool get isNotAuthenticated => this == User.empty;

  factory User.fromJson(Map<String, dynamic> jsonModel) {
    return User(
        name: jsonModel[kUserCacheName],
        id: jsonModel[kUserCacheID] ?? '',
        email: jsonModel[kUserCacheEmail],
        profilePicturePath: jsonModel[kUserCacheProfilePicture],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kUserCacheName: name,
      kUserCacheID:id,
      kUserCacheEmail:email,
      kUserCacheProfilePicture:profilePicturePath,
    };
  }

}
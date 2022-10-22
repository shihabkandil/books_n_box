
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
        name: jsonModel[userCacheName],
        id: jsonModel[userCacheId] ?? '',
        email: jsonModel[userCacheEmail],
        profilePicturePath: jsonModel[userCachePhoto],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      userCacheName: name,
      userCacheId:id,
      userCacheEmail:email,
      userCachePhoto:profilePicturePath,
    };
  }

}
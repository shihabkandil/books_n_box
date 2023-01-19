import '../../utils/constants/firestore_fields.dart';

class UserReview {
  String userName;
  String userImageUrl;
  String review;
  String id;

  UserReview(
      {required this.userName,
      required this.userImageUrl,
      required this.review,
      required this.id});

  factory UserReview.fromJson(Map<String, dynamic> json) => UserReview(
      userName: json[kUserNameField],
      review: json[kReviewTextField],
      userImageUrl: json[kUserImageLink],
      id: json[kUserId]);

  Map<String, dynamic> toJson() => {
        kUserNameField: userName,
        kReviewTextField: userImageUrl,
        kUserImageLink: review,
      };
}

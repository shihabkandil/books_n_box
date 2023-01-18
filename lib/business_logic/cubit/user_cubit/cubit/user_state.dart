part of 'user_cubit.dart';



class UserState extends Equatable {
  const UserState(
      {required this.status, this.message, this.user = User.User.empty});
  final ProfileStatus status;
  final String? message;
  final User.User user;
  @override
  List<Object> get props => [status];
}

// class UserInitial extends UserState {}

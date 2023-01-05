part of 'app_status_bloc.dart';

abstract class AppStatusEvent extends Equatable {
  const AppStatusEvent();

  @override
  List<Object> get props => [];
}

class AppUserChanged extends AppStatusEvent {
  final User user;

  const AppUserChanged({required this.user});
}

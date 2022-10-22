part of 'app_status_bloc.dart';

abstract class AppStatusEvent extends Equatable {
  const AppStatusEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppStatusEvent {}

class AppUserChanged extends AppStatusEvent {
  final User user;
  const AppUserChanged(this.user);
}
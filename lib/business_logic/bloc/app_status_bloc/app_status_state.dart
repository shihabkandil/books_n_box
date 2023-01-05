part of 'app_status_bloc.dart';

enum AppStatus { authenticated, unAuthenticated }

class AppStatusState extends Equatable {
  const AppStatusState({
    required this.status,
    this.user = User.empty,
  });

  final AppStatus status;
  final User user;

  const AppStatusState.authenticated(User user)
      : this(status: AppStatus.authenticated, user: user);

  const AppStatusState.unauthenticated()
      : this(status: AppStatus.unAuthenticated);

  @override
  List<Object> get props => [status, user];
}

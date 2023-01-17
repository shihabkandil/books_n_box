import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user.dart';
import '../../../data/repository/auth_repository.dart';
part 'app_status_event.dart';
part 'app_status_state.dart';

class AppStatusBloc extends Bloc<AppStatusEvent,AppStatusState> {

  final AuthRepository _authRepository;
  late final StreamSubscription<User> _userSubscription;

  AppStatusBloc({required AuthRepository authRepository})
      :_authRepository = authRepository,
        super(authRepository.currentUser.isAuthenticated
          ? AppStatusState.authenticated(authRepository.currentUser)
          : const AppStatusState.unauthenticated()
      ) {
    on<AppUserChanged>(_onUserChanged);
    _userSubscription =
        _authRepository.user.listen((user) => add(AppUserChanged(user: user)),);
  }

  void _onUserChanged(AppUserChanged event, Emitter<AppStatusState> emit) {
    emit(event.user.isAuthenticated
        ? AppStatusState.authenticated(event.user)
        : const AppStatusState.unauthenticated());
  }

  @override
  void onTransition(Transition<AppStatusEvent, AppStatusState> transition) {
    print(transition.toString());
    super.onTransition(transition);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/bloc/app_status_bloc/app_status_bloc.dart';
import '../business_logic/cubit/localization_cubit/cubit/localization_cubit.dart';
import '../business_logic/cubit/theme_cubit/cubit/theme_cubit.dart';
import '../data/repository/auth_repository.dart';
import 'app_theme.dart';

class MainBlocProviders extends StatelessWidget {
  const MainBlocProviders(
      {Key? key,
      required this.child,
      required this.appTheme,
      required this.appLocale})
      : super(key: key);
  final Widget child;
  final ThemeData appTheme;
  final Locale appLocale;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AppStatusBloc>(
        create: (context) =>
            AppStatusBloc(authRepository: context.read<AuthRepository>()),
      ),
      BlocProvider<LocalizationCubit>(
        create: (context) => LocalizationCubit(appLocale),
      ),
      BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit(appTheme),
      ),
    ], child: child);
  }
}

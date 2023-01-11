import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_app_project/data/repository/user_data_cache.dart';
import 'business_logic/bloc/app_status_bloc/app_status_bloc.dart';
import 'business_logic/cubit/localization_cubit/cubit/localization_cubit.dart';
import 'package:mobile_app_project/business_logic/cubit/theme_cubit/cubit/theme_cubit.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';
import 'data/repository/auth_repository.dart';
import 'utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

List<CameraDescription> cameras = [];
CameraDescription? firstCamera;
var appTheme;
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  var theme = await UserDataCache().readThemePreferences();
  if (theme == null) {
    theme = true;
    UserDataCache().writeThemePreferences(theme);
  }
  appTheme = theme ? AppColors.lightTheme : AppColors.darkTheme;

  await Firebase.initializeApp();
  await UserDataCache.init();
  final authRepository = AuthRepository();
  await authRepository.user.first;
  
  String lang = UserDataCache().readLanguagePreference();
  FlutterNativeSplash.remove();

  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  cameras = await availableCameras();
  // Get a specific camera from the list of available cameras.
  firstCamera = cameras.first;

  runApp(BooksNBox(
    authRepository: authRepository,
    lang: Locale(lang, ''),
  ));
}

class BooksNBox extends StatelessWidget {
  BooksNBox(
      {Key? key,
      AppRouter? appRouter,
      AuthRepository? authRepository,
      required this.lang})
      : _appRouter = appRouter ?? AppRouter(),
        _authRepository = authRepository ?? AuthRepository(),
        super(key: key);

  final AppRouter _appRouter;
  final AuthRepository _authRepository;
  final Locale lang;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppStatusBloc>(
            create: (context) => AppStatusBloc(authRepository: _authRepository),
          ),
          BlocProvider<LocalizationCubit>(
            create: (context) => LocalizationCubit(),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(appTheme),
          ),
        ],
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state2) {
                return MaterialApp.router(
                  locale: state.state == LanguageState.Initial
                      ? lang
                      : state.locale,
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: [
                    Locale('en', ''), // English, no country code
                    Locale('ar', ''),
                  ],
                  routerConfig: _appRouter.router,
                  theme: state2.appTheme,
                  debugShowCheckedModeBanner: false,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

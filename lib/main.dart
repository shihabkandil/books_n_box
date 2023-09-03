import 'package:camera/camera.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_app_project/data/repository/user_data_cache.dart';
import 'package:mobile_app_project/utils/app_theme.dart';
import 'business_logic/bloc/app_status_bloc/app_status_bloc.dart';
import 'business_logic/cubit/localization_cubit/cubit/localization_cubit.dart';
import 'package:mobile_app_project/business_logic/cubit/theme_cubit/cubit/theme_cubit.dart';
import 'data/repository/auth_repository.dart';
import 'utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'utils/main_bloc_providers.dart';

List<CameraDescription> cameras = [];
CameraDescription? firstCamera;

void main() async {


  
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

 await Firebase.initializeApp();
  await UserDataCache.init(); 
  var theme = await UserDataCache().readThemePreferences();
  var currentTheme = AppTheme.darkTheme;
  if (theme == null) {
    theme = true;
    UserDataCache().writeThemePreferences(theme);
  }
  if (theme == false) {
    currentTheme = AppTheme.lightTheme;
  }

  await FirebaseMessaging.instance.getToken();
  String lang = UserDataCache().readLanguagePreference();
  FlutterNativeSplash.remove();

  // Obtain a list of the available cameras on the device.
  cameras = await availableCameras();
  // Get a specific camera from the list of available cameras.
  firstCamera = cameras.first;

  runApp(BooksNBox(
    currentTheme: currentTheme,
    locale: Locale(lang),
  ));
}

class BooksNBox extends StatelessWidget {
  BooksNBox(
      {Key? key,
      AppRouter? appRouter,
      AuthRepository? authRepository,
      required this.currentTheme,
      required this.locale})
      : _appRouter = appRouter ?? AppRouter(),
        _authRepository = authRepository ?? AuthRepository(),
        super(key: key);

  final AppRouter _appRouter;
  final AuthRepository _authRepository;
  final ThemeData currentTheme;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: MainBlocProviders(
        appTheme: currentTheme,
        appLocale: locale,
        child: BlocListener<AppStatusBloc, AppStatusState>(
          listener: (context, state) {
            if (state.status == AppStatus.unAuthenticated) {
              _appRouter.router.go('/');
            }
          },
          child: BlocBuilder<LocalizationCubit, LocalizationState>(
            builder: (context, state) {
              return BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, themeState) {
                  return MaterialApp.router(
                    locale: state.locale,
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
                    theme: themeState.appTheme,
                    debugShowCheckedModeBanner: false,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

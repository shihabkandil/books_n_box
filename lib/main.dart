import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_app_project/business_logic/cubit/localization_cubit/cubit/localization_cubit.dart';
import 'data/repository/auth_repository.dart';
import 'utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'utils/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

List<CameraDescription> cameras = [];
CameraDescription? firstCamera;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  final authRepository = AuthRepository();
  await authRepository.user.first;
  FlutterNativeSplash.remove();

  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  firstCamera = cameras.first;

  runApp(BooksNBox());
}

class BooksNBox extends StatelessWidget {
  BooksNBox({Key? key, AppRouter? appRouter, AuthRepository? authRepository})
      : _appRouter = appRouter ?? AppRouter(),
        _authRepository = authRepository ?? AuthRepository(),
        super(key: key);

  final AppRouter _appRouter;
  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider(providers: [RepositoryProvider.value(value: _authRepository)],)
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider<LocalizationCubit>(
        create: (context) => LocalizationCubit(),
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
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
              theme: AppThemeData.materialTheme,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}

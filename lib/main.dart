import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobile_app_project/utils/app_router.dart';
import 'package:mobile_app_project/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repository/auth_repository.dart';
import 'data/repository/user_data_cache.dart';

List<CameraDescription> cameras = [];
CameraDescription? firstCamera;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await UserDataCache.init();
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
  BooksNBox({Key? key,AppRouter? appRouter,AuthRepository? authRepository})
      : _appRouter = appRouter ?? AppRouter(),
        _authRepository = authRepository ?? AuthRepository(),
        super(key: key);

   final AppRouter _appRouter;
   final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: MaterialApp.router(
        routerConfig: _appRouter.router,
        theme: AppThemeData.materialTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobile_app_project/data/web_services/nyt_web_services.dart';
import 'package:mobile_app_project/utils/app_router.dart';
import 'package:mobile_app_project/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repository/auth_repository.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  final authRepository = AuthRepository();
  await authRepository.user.first;
  FlutterNativeSplash.remove();
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
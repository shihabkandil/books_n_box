import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/app_router.dart';
import 'package:mobile_app_project/utils/app_theme.dart';

void main() {
  runApp(BooksNBox());
}

class BooksNBox extends StatelessWidget {
  BooksNBox({Key? key,AppRouter? appRouter})
      : _appRouter = appRouter ?? AppRouter() ,super(key: key);
   final AppRouter _appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.router,
      theme: AppThemeData.materialTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}


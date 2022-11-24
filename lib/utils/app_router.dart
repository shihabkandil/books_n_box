import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/screens/auth_screens/register/register_screen.dart';
import 'package:mobile_app_project/screens/Settings%20Screen/settings_screen.dart';
import 'package:mobile_app_project/screens/book_details_screen/book_details_screen.dart';
import 'package:mobile_app_project/screens/widgets/take_picture.dart';
import 'package:mobile_app_project/screens/widgets/text_recognizer.dart';
import '../business_logic/cubit/auth_cubit/auth_cubit.dart';
import '../data/repository/auth_repository.dart';
import '../screens/auth_screens/login/login_screen.dart';
import '../screens/home_screen/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/edit_profile/home/profile_screen.dart';
import 'package:mobile_app_project/main.dart';

/// To navigate use
/// onTap: () => GoRouter.of(context).go('/page_path')
/// OR
/// onTap: () => context.go('/page_path')
class AppRouter {
  final GoRouter router = GoRouter(

    routes: [
      GoRoute(
          path: '/home', // /
          builder: (context, state) => BlocProvider(
                create: (context) =>
                    AuthCubit(authRepository: context.read<AuthRepository>()),
                child: const LoginScreen(), //
              ),
          routes: [
            GoRoute(
              path: 'register',
              builder: (context, state) => BlocProvider(
                create: (context) =>
                    AuthCubit(authRepository: context.read<AuthRepository>()),
                child: RegisterScreen(),//
              ),
            ),
          ]),
      GoRoute( 
          path: '/', // /home
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'book_details',
              builder: (context, state) => const BookDetailsScreen(),
            ),
            GoRoute(
              path: 'profile',
              builder: (context, state) => EditProfilePage(),
            ),
            GoRoute(
              path: 'settings',
              builder: (context, state) => SettingsScreen(),
            ), 
            GoRoute(
              path: 'recognizeText',
              builder: (context, state) => TextRecognizerView(),
            ),    
          ]),
    ],
    // errorBuilder: (context, state) => ErrorScreen(state.error),
  );
}

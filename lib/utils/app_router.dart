import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/camera_cubit/camera_cubit.dart';
import 'package:mobile_app_project/business_logic/cubit/google_books_cubit/google_books_cubit.dart';
import 'package:mobile_app_project/business_logic/cubit/text_recognition_cubit/text_recognition_cubit.dart';
import 'package:mobile_app_project/business_logic/cubit/nyt_best_sellers_cubit/nyt_best_sellers_cubit.dart';
import 'package:mobile_app_project/screens/auth_screens/register/register_screen.dart';
import 'package:mobile_app_project/screens/Settings%20Screen/settings_screen.dart';
import 'package:mobile_app_project/screens/book_details_screen/book_details_screen.dart';
import 'package:mobile_app_project/screens/widgets/display_picture.dart';
import 'package:mobile_app_project/screens/widgets/take_picture.dart';
import 'package:mobile_app_project/screens/widgets/text_recognizer_view.dart';
import '../business_logic/bloc/app_status_bloc/app_status_bloc.dart';
import '../business_logic/cubit/auth_cubit/auth_cubit.dart';
import '../data/repository/auth_repository.dart';
import '../screens/auth_screens/login/login_screen.dart';
import '../screens/edit_profile/home/profile_screen.dart';
import '../screens/home_screen/home/home_screen.dart';
import '../screens/widgets/search_with_text.dart';

/// To navigate use
/// onTap: () => GoRouter.of(context).go('/page_path')
/// OR
/// onTap: () => context.go('/page_path')
///
class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/', // /home
          builder: (context, state) => BlocProvider(
                create: (context) =>
                    AuthCubit(authRepository: context.read<AuthRepository>()),
                child: LoginScreen(),
              ),
          routes: [
            GoRoute(
              path: 'register',
              builder: (context, state) => BlocProvider(
                create: (context) =>
                    AuthCubit(authRepository: context.read<AuthRepository>()),
                child: RegisterScreen(),
              ),
            ),
          ],
          redirect: (context, state) {
            final appStatus =
                BlocProvider.of<AppStatusBloc>(context).state.status;
            if (appStatus == AppStatus.authenticated &&
                context.read<AuthRepository>().getUserRememberMe()) {
              return '/home';
            } else {
              return null;
            }
          }),
      GoRoute(
          path: '/home',
          builder: (context, state) => BlocProvider(
                create: (context) => NytBestSellersCubit(),
                child: HomeScreen(),
              ),
          routes: [
            GoRoute(
              path: 'settings',
              builder: (context, state) => SettingsScreen(),
            ),
            GoRoute(
              path: 'book_details',
              builder: (context, state) => const BookDetailsScreen(),
            ),
            GoRoute(
              path: 'profile',
              builder: (context, state) => BlocProvider(
                create: (context) =>
                    AuthCubit(authRepository: context.read<AuthRepository>()),
                child: EditProfilePage(),
              ),
            ),
            GoRoute(
              path: 'settings',
              builder: (context, state) => SettingsScreen(),
            ),
            GoRoute(
                path: 'takePicture',
                builder: (context, state) => BlocProvider(
                      create: (context) => CameraCubit(),
                      child: TakePictureScreen(),
                    ),
                routes: [
                  GoRoute(
                    path: 'textRecognizer',
                    builder: (context, state) => BlocProvider(
                      create: (context) => TextRecognitionCubit(),
                      child:
                          TextRecognizerView(imagePath: state.extra as String),
                    ),
                  )
                ]),
            GoRoute(
              path: 'displayPicture/:imagePath/:text',
              name: 'DisplayPictureScreen',
              builder: (context, state) {
                return DisplayPictureScreen(
                  imagePath: state.params["imagePath"]!,
                  text: state.params["text"]!,
                );
              },
            ),
            GoRoute(
              path: 'searchwithtextscreen/:text',
              name: 'SearchWithTextScreen',
              builder: (context, state) {
                return BlocProvider(
                  create: (context) => GoogleBooksCubit()
                    ..searchGoogleBooks(state.params["text"]!),
                  child: SearchWithText(text: state.params["text"]!),
                );
              },
            ),
          ]),
    ],
    // errorBuilder: (context, state) => ErrorScreen(state.error),
  );
}

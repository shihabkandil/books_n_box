import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/user_cubit/cubit/user_cubit.dart';
import 'package:mobile_app_project/data/repository/user_repository.dart';
import '../business_logic/bloc/app_status_bloc/app_status_bloc.dart';
import '../business_logic/cubit/auth_cubit/auth_cubit.dart';
import '../business_logic/cubit/bookmarks_cubit/bookmarks_cubit.dart';
import '../business_logic/cubit/camera_cubit/camera_cubit.dart';
import '../business_logic/cubit/google_books_cubit/google_books_cubit.dart';
import '../business_logic/cubit/nyt_best_sellers_cubit/nyt_best_sellers_cubit.dart';
import '../business_logic/cubit/text_recognition_cubit/text_recognition_cubit.dart';
import '../data/repository/auth_repository.dart';
import '../screens/book_details_screen/googlebook_details_screen.dart';
import '../screens/discover_reviews_screen/discover_reviews_screen.dart';
import '../screens/edit_profile/widgets/change_password.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/register_screen/register_screen.dart';
import '../screens/reset_password_screen/reset_password_screen.dart';
import '../screens/book_details_screen/bestsellers_details_screen.dart';
import '../screens/edit_profile/profile_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/my_shelf_screen/my_shelf_screen.dart';
import '../screens/settings_screen/settings_screen.dart';
import '../screens/widgets/display_picture.dart';
import '../screens/widgets/search_with_text.dart';
import '../screens/widgets/take_picture.dart';
import '../screens/widgets/text_recognizer_view.dart';

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
                create: (context) => AuthCubit(authRepository: context.read<AuthRepository>()),
                child: LoginScreen(),
              ),
          routes: [
            GoRoute(
              path: 'register',
              builder: (context, state) => BlocProvider(
                create: (context) => AuthCubit(authRepository: context.read<AuthRepository>()),
                child: RegisterScreen(),
              ),
            ),
            GoRoute(
              path: 'reset_password',
              builder: (context, state) => BlocProvider(
                create: (context) => AuthCubit(authRepository: context.read<AuthRepository>()),
                child: ResetPasswordScreen(),
              ),
            ),
          ],
          redirect: (context, state) {
            final appStatus = BlocProvider.of<AppStatusBloc>(context).state.status;
            if (appStatus == AppStatus.authenticated) {
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
              path: 'my_shelf',
              builder: (context, state) => BlocProvider(
                create: (context) => BookmarksCubit(retrivedBooks: {}),
                child: MyShelfScreen(),
              ),
            ),
            GoRoute(
              path: 'discover',
              builder: (context, state) => DiscoverReviewsScreen(),
            ),
            GoRoute(
              path: 'book_details',
              builder: (context, state) => GoogleBookDetailsScreen(
                allBook: state.extra as Map<String, dynamic>,
              ),
            ),
            GoRoute(
              path: 'bestseller_details',
              builder: (context, state) => BestsellersDetailsScreen(
                allBook: state.extra as Map<String, dynamic>,
              ),
            ),
            GoRoute(
                path: 'profile',
                builder: (context, state) => BlocProvider(
                      create: (context) => UserCubit(),
                      child: EditProfilePage(),
                    ),
                routes: [
                  GoRoute(
                    path: 'changePassword',
                    builder: (context, state) => BlocProvider(
                      create: (context) => UserCubit(),
                      child: ChangePasswordScreen(),
                    ),
                  )
                ]),
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
                      child: TextRecognizerView(imagePath: state.extra as String),
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
                  create: (context) => GoogleBooksCubit()..searchGoogleBooks(state.params["text"]!),
                  child: SearchWithText(text: state.params["text"]!),
                );
              },
            ),
          ]),
    ],
    // errorBuilder: (context, state) => ErrorScreen(state.error),
  );
}

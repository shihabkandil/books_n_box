import 'package:go_router/go_router.dart';
import '../screens/auth_screens/login_screen.dart';

/// To navigate use
/// onTap: () => GoRouter.of(context).go('/page_path')
/// OR
/// onTap: () => context.go('/page_path')
class AppRouter{
  final GoRouter router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const LoginScreen(),
          ),
          // GoRoute(
          //   path: '/page2',
          //   builder: (context, state) => const Page2Screen(),
          // ),
        ],
      // errorBuilder: (context, state) => ErrorScreen(state.error),
    );
}
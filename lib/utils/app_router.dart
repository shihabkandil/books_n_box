import 'package:go_router/go_router.dart';
import '../screens/auth_screens/login/login_screen.dart';
import '../screens/home_screen/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../business_logic/cubit/auth_cubit/auth_cubit.dart';
/// To navigate use
/// onTap: () => GoRouter.of(context).go('/page_path')
/// OR
/// onTap: () => context.go('/page_path')
class AppRouter {
  final GoRouter router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => BlocProvider(
              create: (context)=>AuthCubit(authRepository: context.read<AuthRepository>()),
              child: const LoginScreen(),
            ),
          ),
           GoRoute(
             path: '/home',
             builder: (context, state) => const HomeScreen(),
           ),
        ],
      // errorBuilder: (context, state) => ErrorScreen(state.error),
    );
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
    // errorBuilder: (context, state) => ErrorScreen(state.error),
  );
}


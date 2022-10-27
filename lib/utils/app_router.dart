import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../business_logic/cubit/auth_cubit/auth_cubit.dart';
import '../data/repository/auth_repository.dart';
import '../screens/auth_screens/login_screen.dart';
import '../screens/home_screen/home/home_screen.dart';
import '../screens/book_view_screen.dart';
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
              child: BookViewScreen(), //loginscreen
            ),
          ),
           GoRoute(
             path: '/home',
             builder: (context, state) => const HomeScreen(),
           ),
        ],
      // errorBuilder: (context, state) => ErrorScreen(state.error),
    );
}


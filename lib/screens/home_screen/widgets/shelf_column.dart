import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:mobile_app_project/screens/home_screen/widgets/tile_template.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';
import '../../widgets/profile_avatar_circle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShelfColumn extends StatelessWidget {
  const ShelfColumn({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.loggedOut) {
          context.go("/");
        }
      },
      child: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            ProfileAvatarCircle(),
            SizedBox(
              height: 20,
            ),
            TileTemplate(
                icon: Icon(Icons.person, color: Colors.white),
                onTap: () {},
                text: Text(
                  localization!.profile,
                  style: TextStyle(color: Colors.white),
                ),
                tail: Icon(Icons.arrow_forward, color: Colors.white),
                color: AppColors.tileColor.withOpacity(0.7)),
            SizedBox(
              height: 20,
            ),
            TileTemplate(
                icon: Icon(Icons.settings, color: Colors.white),
                onTap: () => context.go('/home/settings'), // /home
                text: Text(localization.settings,
                    style: TextStyle(color: Colors.white)),
                tail: Icon(Icons.arrow_forward, color: Colors.white),
                color: AppColors.tileColor.withOpacity(0.7)),
            SizedBox(
              height: 20,
            ),
            TileTemplate(
                icon: Icon(Icons.logout, color: Colors.white),
                onTap: () => BlocProvider.of<AuthCubit>(context).logOut(),
                text: Text(localization.logOut,
                    style: TextStyle(color: Colors.white)),
                tail: Icon(Icons.arrow_forward, color: Colors.white),
                color: Colors.red.withOpacity(0.7)),
          ],
        ),
      ),
    );
  }
}

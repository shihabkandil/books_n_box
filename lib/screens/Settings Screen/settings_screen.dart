import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_project/business_logic/cubit/theme_cubit/cubit/theme_cubit.dart';
import 'package:mobile_app_project/main.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/repository/user_data_cache.dart';
import '../home_screen/widgets/tile_template.dart';
import 'widgets/lang_btn.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          margin: EdgeInsets.only(top: 65, left: 35, right: 40),
          child: Column(
            children: [
              Text(
                localization!.settings,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40, color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      localization.language,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Container(child: LangBtn()),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      localization.theme,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Container(
                    child: BlocBuilder<ThemeCubit, ThemeState>(
                      builder: (context, state) {
                        return SwitcherButton(
                          value: state.appTheme == AppColors.lightTheme,
                          onChange: (value) {
                            BlocProvider.of<ThemeCubit>(context).switchTheme();
                            UserDataCache().writeThemePreferences(value);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                child: Text(
                  localization.help,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TileTemplate(
                  icon: Icon(Icons.question_mark_sharp, color: Colors.white),
                  onTap: () {},
                  text: Text(localization.faq, style: TextStyle(color: Colors.white)),
                  color: Colors.white.withOpacity(0.7)),
              SizedBox(
                height: 20,
              ),
              TileTemplate(
                  icon: Icon(Icons.lock, color: Colors.white),
                  onTap: () {},
                  text: Text(localization.privacyPolicy, style: TextStyle(color: Colors.white)),
                  color: Colors.white.withOpacity(0.7)),
            ],
          ),
        ));
  }
}

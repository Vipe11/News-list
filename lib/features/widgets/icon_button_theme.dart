import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/features/bloc/theme_cubit/theme_cubit.dart';

class ChangeButtonTheme extends StatelessWidget {
  const ChangeButtonTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeCubit = context.watch<ThemeCubit>();

    // Иконка
    IconData setIconTheme(String theme) {
      switch (themeCubit.state.theme) {
        case 'dark':
          return Icons.brightness_3_sharp;
        case 'light':
          return Icons.brightness_high;
        default:
          return Icons.brightness_4;
      }
    }

    return IconButton(
      onPressed: () {
        switch (themeCubit.state.theme) {
          case 'system':
            themeCubit.setTheme('dark');
            break;
          case 'dark':
            themeCubit.setTheme('light');
            break;
          case 'light':
            themeCubit.setTheme('system');
            break;
        }
      },
      icon: Icon(setIconTheme(themeCubit.state.theme)),
    );
  }
}

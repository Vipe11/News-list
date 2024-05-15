import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/features/bloc/theme_cubit/theme_cubit.dart';
import 'package:news_list/themes/theme.dart';

import 'features/screens/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.isDark ? darkTheme : lightTheme,
            darkTheme: state.isLight ? lightTheme : darkTheme,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

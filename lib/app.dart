import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_list/features/bloc/theme_cubit/theme_cubit.dart';
import 'package:news_list/features/screens/home_screen/bloc/bloc/news_list_bloc.dart';
import 'package:news_list/repositories/news_repository/interface_news_repository.dart';
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
        BlocProvider(
          create: (context) => NewsListBloc(
            GetIt.I<InterfaceNewsRepository>(),
          ),
        )
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

import 'package:dartapp/core/assets/theme/theme.dart';
import 'package:dartapp/features/auth/presentation/pages/account_page.dart';
import 'package:dartapp/features/auth/presentation/pages/login_page.dart';
import 'package:dartapp/features/auth/presentation/pages/splash_page.dart';
import 'package:dartapp/features/main/presentation/pages/home_page.dart';
import 'package:dartapp/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartapp/features/main/presentation/bloc/screen_data_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScreenDataBloc>(
      create: (context) => getIt<ScreenDataBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        initialRoute: "/home",
        routes: <String, WidgetBuilder>{
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}

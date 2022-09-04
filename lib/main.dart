
import 'package:bloc/bloc.dart';
import 'package:first_flutter_application/layout/news_app/cubit/states.dart';
import 'package:first_flutter_application/layout/todo_app/home_layout.dart';
import 'package:first_flutter_application/modules/bmi_resulte/bmi_resulte_screen.dart';
import 'package:first_flutter_application/modules/bmi/bmi_screen.dart';
import 'package:first_flutter_application/modules/counter/counter_screen.dart';
import 'package:first_flutter_application/modules/login/login_screen.dart';
import 'package:first_flutter_application/modules/messenger/messenger_screen.dart';
import 'package:first_flutter_application/shared/bloc_observer.dart';
import 'package:first_flutter_application/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'modules/home/home_screen.dart';
import 'modules/users/users_screen.dart';

void main() {
  DioHelper.init();
  BlocOverrides.runZoned( () => runApp(MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBuisness(),

      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
    bodyText1: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    ),
    ),
    appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    ),
    color: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
    color: Colors.black,
    ),
    titleTextStyle: TextStyle(
    color: Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    ),
    titleSpacing: 20.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 20.0,
    selectedItemColor: Colors.deepOrange,
    )
    ),
    darkTheme: ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.blueGrey,
    textTheme: TextTheme(
    bodyText1: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    ),
    ),
    appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    ),
    color: Colors.blueGrey,
    elevation: 0.0,
    iconTheme: IconThemeData(
    color: Colors.white,
    ),
    titleTextStyle: TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.blueGrey,
    unselectedItemColor: Colors.white,
    elevation: 20.0,
    selectedItemColor: Colors.deepOrange,
    )
    ),
    themeMode: NewsCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
    home: NewsLayout(),
    );
    }
    )
    );
  }
}
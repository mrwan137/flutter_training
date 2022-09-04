import 'package:first_flutter_application/layout/news_app/cubit/states.dart';
import 'package:first_flutter_application/modules/business/business_screen.dart';
import 'package:first_flutter_application/modules/settings_screen/settings_screen.dart';
import 'package:first_flutter_application/modules/sports/sports_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/scince/Scince_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode(){
    isDark = !isDark;
    emit(NewsModeChangeState());
  }


  int cuurentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business
      ),
      label: 'Business'
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports
      ),
      label: 'Sports'
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science
      ),
      label: 'Scince'
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    SinceScreen(),
  ];

  List<dynamic> buisness = [];

  void changeBottomNavBar(int index){
    cuurentIndex = index;
    emit(NewsBottomNavState());
  }

  void getBuisness(){
    emit(NewsBuisnessLoadingState());

    DioHelper.getData(
        'v2/top-headlines',
        {
          'country':'eg',
          'category':'business',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value) {
      buisness = value.data['articles'];
      print(buisness[0]['title']);

      emit(NewsBuisnessSuccesState());
    }).catchError((error) {
      print(error.toString());

      emit(NewsBuisnessErrorState(error.toString()));
    });
  }
}
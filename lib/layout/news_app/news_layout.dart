
import 'package:first_flutter_application/layout/news_app/cubit/cubit.dart';
import 'package:first_flutter_application/layout/news_app/cubit/states.dart';
import 'package:first_flutter_application/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
              ),
              actions: [
                IconButton(icon: Icon(Icons.search),
                  onPressed: (){},
                ),
                IconButton(icon: Icon(Icons.brightness_6_outlined),
                  onPressed: (){
                    NewsCubit.get(context).changeMode();
                  },
                )
              ],
            ),
            body: cubit.screens[cubit.cuurentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.cuurentIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
          );
        },
    );
  }
}

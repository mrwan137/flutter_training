import 'package:first_flutter_application/shared/app_cupit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/todo_app/archived_task/archived_task_screen.dart';
import '../../modules/todo_app/done_task/done_task_screen.dart';
import '../../modules/todo_app/new_task/new_task_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  int curentScreen = 0;
  List<Widget> screens = [
    NewTask(),
    DoneTask(),
    ArchivedTask(),
  ];

  List<String> titles = [
    'Tasks',
    'Done Tasks',
    'Archived Task',
  ];

  void changeIndex(int index){
    curentScreen = index;
    emit(AppChangeNavBarState());
  }

  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        print('database created');

        await database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('error on creating database error is: ${error.toString()}');
        });
      },
      onOpen: (database) {
        print('database opened successfully');

        getDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertIntoDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database!.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks (title, date, time, status) VALUES ("$title","$date","$time","new")'
      ).then((value) {
        print('$value inserted successfully');

        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);

      }).catchError((error) {
        print('error in inserting record the message is: ${error.toString()}');
      });
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    emit(AppDatabaseLoadingState());

    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    return await database!.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element) {
        if(element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }

      });

      emit(AppGetDatabaseState());
    });
  }

  void updateDatabase({
    required String statues,
    required int id,
  })
  {
    database!.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        [statues, id,]
    ).then((value) {
      emit(AppUpdateDatabaseState());

      getDataFromDatabase(database);
    });
  }

  void deleteFromDatabase({
    required int id,
  })
  {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      emit(AppDeleteFromDatabaseState());

      getDataFromDatabase(database);
    });
  }

  IconData floatActionButtonIcon = Icons.edit;
  bool isBottomSheetOpened = false;

  void changeBottomSheet({
    required bool isShown,
    required IconData icon,
  }){
    isBottomSheetOpened = isShown;
    floatActionButtonIcon = icon;

    emit(AppBottomSheetChangedState());
  }
}
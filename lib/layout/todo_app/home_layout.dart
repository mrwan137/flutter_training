import 'package:first_flutter_application/modules/todo_app/archived_task/archived_task_screen.dart';
import 'package:first_flutter_application/modules/todo_app/done_task/done_task_screen.dart';
import 'package:first_flutter_application/modules/todo_app/new_task/new_task_screen.dart';
import 'package:first_flutter_application/shared/app_cupit/app_cupit.dart';
import 'package:first_flutter_application/shared/app_cupit/states.dart';
import 'package:first_flutter_application/shared/components/componets.dart';
import 'package:first_flutter_application/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, AppStates state) {
          if(state is AppInsertDatabaseState)
            Navigator.pop(context);
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.curentScreen],
              ),
            ),
            body: state is AppDatabaseLoadingState ? Center(child: CircularProgressIndicator()) : cubit.screens[cubit.curentScreen],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetOpened) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertIntoDatabase(
                      title: titleController.text,
                      date: dateController.text,
                      time: timeController.text,
                    );
                    titleController.text = '';
                    dateController.text = '';
                    timeController.text = '';
                  }
                } else {
                  scaffoldKey.currentState!.showBottomSheet(
                        (context) =>
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20.0),
                          child: Expanded(
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defulteFormField(
                                    controller: titleController,
                                    keyboardType: TextInputType.text,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Title can\'t be empty';
                                      }
                                      return null;
                                    },
                                    label: 'Title',
                                    prefix: Icons.title,
                                  ),
                                  SizedBox(height: 15.0,),
                                  defulteFormField(
                                    controller: timeController,
                                    keyboardType: TextInputType.none,
                                    onTap: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        timeController.text =
                                            value!.format(context);
                                      });
                                    },
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'time can\'t be empty';
                                      }
                                      return null;
                                    },
                                    label: 'Time',
                                    prefix: Icons.watch_later_outlined,
                                  ),
                                  SizedBox(height: 15.0,),
                                  defulteFormField(
                                    controller: dateController,
                                    keyboardType: TextInputType.none,
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now().add(Duration(days: 30)),
                                      ).then((value) {
                                        dateController.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'date can\'t be empty';
                                      }
                                      return null;
                                    },
                                    label: 'Date',
                                    prefix: Icons.calendar_today,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    elevation: 20.0,
                  ).closed.then((value) {
                    cubit.changeBottomSheet(isShown: false, icon: Icons.edit,);
                  });

                  cubit.changeBottomSheet(isShown: true, icon: Icons.add,);
                }
              },
              child: Icon(
                cubit.floatActionButtonIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.curentScreen,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archived Tasks',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}
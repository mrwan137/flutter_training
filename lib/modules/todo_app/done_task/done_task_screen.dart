import 'package:first_flutter_application/shared/app_cupit/app_cupit.dart';
import 'package:first_flutter_application/shared/app_cupit/states.dart';
import 'package:first_flutter_application/shared/components/componets.dart';
import 'package:first_flutter_application/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneTask extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var tasks = AppCubit.get(context).doneTasks;

          return tasksBuilder(tasks: tasks);
        });
  }
}
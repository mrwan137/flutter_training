import 'package:first_flutter_application/modules/counter/cubit/cubit.dart';
import 'package:first_flutter_application/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter Screen'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      'Minus',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '${CounterCubit.get(context).cnt}',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).plus();
                    },
                    child: Text(
                      'Plus',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
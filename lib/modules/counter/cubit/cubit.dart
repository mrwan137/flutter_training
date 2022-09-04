import 'package:first_flutter_application/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  int cnt = 0;

  static CounterCubit get(context) => BlocProvider.of(context);

  void minus(){
    cnt--;
    emit(CounterChangeState());
  }
  void plus(){
    cnt++;
    emit(CounterChangeState());
  }
}
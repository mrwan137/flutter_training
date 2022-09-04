abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsModeChangeState extends NewsStates {}

class NewsBuisnessLoadingState extends NewsStates {}

class NewsBuisnessSuccesState extends NewsStates {}

class NewsBuisnessErrorState extends NewsStates {
  final error;

  NewsBuisnessErrorState(this.error);
}
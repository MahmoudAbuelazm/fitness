import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void fetchDailyHomeData() async {
    emit(HomeLoading());
    try {
      // Simulate data fetch latency
      await Future.delayed(const Duration(seconds: 1));
      
      emit(const HomeLoaded(
        currentCalories: 1250,
        totalCalories: 2500,
        currentProtein: 85,
        currentCarbs: 120,
        currentFat: 40,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}

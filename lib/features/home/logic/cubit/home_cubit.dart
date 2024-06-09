import 'package:flutter_application_1/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.inital());

  void getHomeData() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.home();
    emit(HomeState.success(response));
  }
}

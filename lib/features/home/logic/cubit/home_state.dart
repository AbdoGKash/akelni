import 'package:flutter_application_1/features/home/data/model/home_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.inital() = _Inital; // private
  const factory HomeState.loading() = Loading;
  const factory HomeState.success(Home home) = Success;
  const factory HomeState.error({required String error}) = Error;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../home/data/model/home_model.dart';
part 'favorite_state.freezed.dart';

// freezed for equatable object
@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.loading() = _Loading;
  const factory FavoritesState.loaded(List<Items> favoritesItems) = Loaded;
  const factory FavoritesState.error(String message) = Error;
}

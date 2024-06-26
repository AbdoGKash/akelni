import 'package:flutter_application_1/features/home/data/model/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoritesState> {
  final Box<Items> box;
  FavoriteCubit(this.box) : super(const FavoritesState.loading());
  void loadFavorites() {
    try {
      // to list becouse is iterable
      final favorites =
          box.values.toList(); //لتحميل البيانات المفضلة من صندوق Hive
      emit(FavoritesState.loaded(favorites));
    } catch (e) {
      emit(FavoritesState.error(e.toString()));
    }
  }

  void addFavorite(Items favoriteItem) async {
    try {
      await box.put(favoriteItem.id, favoriteItem);
      loadFavorites();
    } catch (e) {
      emit(FavoritesState.error(e.toString()));
    }
  }

  void removeFavorite(String id) async {
    try {
      await box.delete(id);
      loadFavorites();
    } catch (e) {
      emit(FavoritesState.error(e.toString()));
    }
  }
}

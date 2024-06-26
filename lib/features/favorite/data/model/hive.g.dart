// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsFavoriteAdapter extends TypeAdapter<ItemsFavorite> {
  @override
  final int typeId = 32;

  @override
  ItemsFavorite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemsFavorite(
      id: fields[0] as int?,
      title: fields[1] as String?,
      price: fields[2] as int?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemsFavorite obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsFavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

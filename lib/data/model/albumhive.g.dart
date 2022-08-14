// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albumhive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumHiveAdapter extends TypeAdapter<AlbumHive> {
  @override
  final int typeId = 1;

  @override
  AlbumHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumHive()
      ..albumIds = (fields[1] as List).cast<int>()
      ..albumLists = (fields[2] as List).cast<PhotoAlbums>();
  }

  @override
  void write(BinaryWriter writer, AlbumHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.albumIds)
      ..writeByte(2)
      ..write(obj.albumLists);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

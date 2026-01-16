// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 2;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      Fname: fields[0] as String,
      Fpassword: fields[1] as String,
      Femail: fields[2] as String,
      Fid: (fields[3] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.Fname)
      ..writeByte(1)
      ..write(obj.Fpassword)
      ..writeByte(2)
      ..write(obj.Femail)
      ..writeByte(3)
      ..write(obj.Fid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

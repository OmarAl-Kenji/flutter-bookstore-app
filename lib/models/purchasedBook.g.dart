// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchasedBook.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchasedBookAdapter extends TypeAdapter<PurchasedBook> {
  @override
  final int typeId = 1;

  @override
  PurchasedBook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchasedBook(
      title: fields[0] as String,
      imageAssetPath: fields[1] as String,
      price: fields[2] as double,
      quantity: fields[3] as int,
      userEmail: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PurchasedBook obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imageAssetPath)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.userEmail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchasedBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

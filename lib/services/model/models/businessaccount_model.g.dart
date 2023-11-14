// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'businessaccount_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BusinessAccountModelAdapter extends TypeAdapter<BusinessAccountModel> {
  @override
  final int typeId = 1;

  @override
  BusinessAccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BusinessAccountModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BusinessAccountModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.bankAccount)
      ..writeByte(2)
      ..write(obj.ibanNumber)
      ..writeByte(3)
      ..write(obj.swiftCode)
      ..writeByte(4)
      ..write(obj.branchCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessAccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

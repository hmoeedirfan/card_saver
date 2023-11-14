// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalaccount_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonalAccountModelAdapter extends TypeAdapter<PersonalAccountModel> {
  @override
  final int typeId = 0;

  @override
  PersonalAccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalAccountModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonalAccountModel obj) {
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
      other is PersonalAccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

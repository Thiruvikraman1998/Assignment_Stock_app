// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyInfoAdapter extends TypeAdapter<CompanyInfo> {
  @override
  final int typeId = 0;

  @override
  CompanyInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyInfo(
      compName: fields[0] as String?,
      compSymbol: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.compName)
      ..writeByte(1)
      ..write(obj.compSymbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VoiceNoteHiveAdapter extends TypeAdapter<VoiceNoteHive> {
  @override
  final int typeId = 1;

  @override
  VoiceNoteHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VoiceNoteHive(
      id: fields[0] as String,
      title: fields[1] as String,
      filePath: fields[2] as String,
      recordedDate: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, VoiceNoteHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.filePath)
      ..writeByte(3)
      ..write(obj.recordedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoiceNoteHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

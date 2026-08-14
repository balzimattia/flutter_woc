// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgramImpl _$$ProgramImplFromJson(Map<String, dynamic> json) =>
    _$ProgramImpl(
      coachId: json['coachId'] as String,
      clienteId: json['clienteId'] as String,
      program: (json['program'] as List<dynamic>)
          .map((e) => ProgramSheet.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestProgramNum: (json['latestProgramNum'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProgramImplToJson(_$ProgramImpl instance) =>
    <String, dynamic>{
      'coachId': instance.coachId,
      'clienteId': instance.clienteId,
      'program': instance.program,
      'latestProgramNum': instance.latestProgramNum,
    };

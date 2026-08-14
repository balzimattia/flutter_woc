// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProgramSheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgramSheetImpl _$$ProgramSheetImplFromJson(Map<String, dynamic> json) =>
    _$ProgramSheetImpl(
      number: (json['number'] as num).toInt(),
      weeks: (json['weeks'] as List<dynamic>)
          .map((e) => Week.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProgramSheetImplToJson(_$ProgramSheetImpl instance) =>
    <String, dynamic>{'number': instance.number, 'weeks': instance.weeks};

_$WeekImpl _$$WeekImplFromJson(Map<String, dynamic> json) => _$WeekImpl(
  number: (json['number'] as num).toInt(),
  days: (json['days'] as List<dynamic>)
      .map((e) => Day.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$WeekImplToJson(_$WeekImpl instance) =>
    <String, dynamic>{'number': instance.number, 'days': instance.days};

_$DayImpl _$$DayImplFromJson(Map<String, dynamic> json) => _$DayImpl(
  number: (json['number'] as num).toInt(),
  isCompleted: json['isCompleted'] as bool,
  exercises: (json['exercises'] as List<dynamic>)
      .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$DayImplToJson(_$DayImpl instance) => <String, dynamic>{
  'number': instance.number,
  'isCompleted': instance.isCompleted,
  'exercises': instance.exercises,
};

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      name: json['name'] as String,
      sets: (json['sets'] as num).toInt(),
      reps: (json['reps'] as num).toInt(),
      rest: (json['rest'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      coachComment: json['coachComment'] as String,
      clienteComment: json['clienteComment'] as String,
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sets': instance.sets,
      'reps': instance.reps,
      'rest': instance.rest,
      'weight': instance.weight,
      'coachComment': instance.coachComment,
      'clienteComment': instance.clienteComment,
    };

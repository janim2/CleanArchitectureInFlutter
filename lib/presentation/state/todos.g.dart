// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Loading _$$_LoadingFromJson(Map<String, dynamic> json) => _$_Loading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LoadingToJson(_$_Loading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_Loaded _$$_LoadedFromJson(Map<String, dynamic> json) => _$_Loaded(
      Todos.fromJson(json['todos'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LoadedToJson(_$_Loaded instance) => <String, dynamic>{
      'todos': instance.todos,
      'runtimeType': instance.$type,
    };

_$_Error _$$_ErrorFromJson(Map<String, dynamic> json) => _$_Error(
      json['message'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_ErrorToJson(_$_Error instance) => <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };

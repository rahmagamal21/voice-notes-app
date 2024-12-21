// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_note_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VoiceNoteState {
  bool get isRecording => throw _privateConstructorUsedError;
  bool get isPaused => throw _privateConstructorUsedError;
  int get recordingDuration => throw _privateConstructorUsedError;

  /// Create a copy of VoiceNoteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceNoteStateCopyWith<VoiceNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceNoteStateCopyWith<$Res> {
  factory $VoiceNoteStateCopyWith(
          VoiceNoteState value, $Res Function(VoiceNoteState) then) =
      _$VoiceNoteStateCopyWithImpl<$Res, VoiceNoteState>;
  @useResult
  $Res call({bool isRecording, bool isPaused, int recordingDuration});
}

/// @nodoc
class _$VoiceNoteStateCopyWithImpl<$Res, $Val extends VoiceNoteState>
    implements $VoiceNoteStateCopyWith<$Res> {
  _$VoiceNoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceNoteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? isPaused = null,
    Object? recordingDuration = null,
  }) {
    return _then(_value.copyWith(
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      recordingDuration: null == recordingDuration
          ? _value.recordingDuration
          : recordingDuration // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceNoteStateImplCopyWith<$Res>
    implements $VoiceNoteStateCopyWith<$Res> {
  factory _$$VoiceNoteStateImplCopyWith(_$VoiceNoteStateImpl value,
          $Res Function(_$VoiceNoteStateImpl) then) =
      __$$VoiceNoteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isRecording, bool isPaused, int recordingDuration});
}

/// @nodoc
class __$$VoiceNoteStateImplCopyWithImpl<$Res>
    extends _$VoiceNoteStateCopyWithImpl<$Res, _$VoiceNoteStateImpl>
    implements _$$VoiceNoteStateImplCopyWith<$Res> {
  __$$VoiceNoteStateImplCopyWithImpl(
      _$VoiceNoteStateImpl _value, $Res Function(_$VoiceNoteStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceNoteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? isPaused = null,
    Object? recordingDuration = null,
  }) {
    return _then(_$VoiceNoteStateImpl(
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      recordingDuration: null == recordingDuration
          ? _value.recordingDuration
          : recordingDuration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$VoiceNoteStateImpl implements _VoiceNoteState {
  const _$VoiceNoteStateImpl(
      {required this.isRecording,
      required this.isPaused,
      required this.recordingDuration});

  @override
  final bool isRecording;
  @override
  final bool isPaused;
  @override
  final int recordingDuration;

  @override
  String toString() {
    return 'VoiceNoteState(isRecording: $isRecording, isPaused: $isPaused, recordingDuration: $recordingDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceNoteStateImpl &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.recordingDuration, recordingDuration) ||
                other.recordingDuration == recordingDuration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isRecording, isPaused, recordingDuration);

  /// Create a copy of VoiceNoteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceNoteStateImplCopyWith<_$VoiceNoteStateImpl> get copyWith =>
      __$$VoiceNoteStateImplCopyWithImpl<_$VoiceNoteStateImpl>(
          this, _$identity);
}

abstract class _VoiceNoteState implements VoiceNoteState {
  const factory _VoiceNoteState(
      {required final bool isRecording,
      required final bool isPaused,
      required final int recordingDuration}) = _$VoiceNoteStateImpl;

  @override
  bool get isRecording;
  @override
  bool get isPaused;
  @override
  int get recordingDuration;

  /// Create a copy of VoiceNoteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceNoteStateImplCopyWith<_$VoiceNoteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VoiceNoteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function() pauseRecording,
    required TResult Function() stopRecording,
    required TResult Function() updateDuration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function()? pauseRecording,
    TResult? Function()? stopRecording,
    TResult? Function()? updateDuration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function()? pauseRecording,
    TResult Function()? stopRecording,
    TResult Function()? updateDuration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(PauseRecording value) pauseRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateDuration value) updateDuration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(PauseRecording value)? pauseRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateDuration value)? updateDuration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(PauseRecording value)? pauseRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateDuration value)? updateDuration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceNoteEventCopyWith<$Res> {
  factory $VoiceNoteEventCopyWith(
          VoiceNoteEvent value, $Res Function(VoiceNoteEvent) then) =
      _$VoiceNoteEventCopyWithImpl<$Res, VoiceNoteEvent>;
}

/// @nodoc
class _$VoiceNoteEventCopyWithImpl<$Res, $Val extends VoiceNoteEvent>
    implements $VoiceNoteEventCopyWith<$Res> {
  _$VoiceNoteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceNoteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartRecordingImplCopyWith<$Res> {
  factory _$$StartRecordingImplCopyWith(_$StartRecordingImpl value,
          $Res Function(_$StartRecordingImpl) then) =
      __$$StartRecordingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartRecordingImplCopyWithImpl<$Res>
    extends _$VoiceNoteEventCopyWithImpl<$Res, _$StartRecordingImpl>
    implements _$$StartRecordingImplCopyWith<$Res> {
  __$$StartRecordingImplCopyWithImpl(
      _$StartRecordingImpl _value, $Res Function(_$StartRecordingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceNoteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartRecordingImpl implements StartRecording {
  const _$StartRecordingImpl();

  @override
  String toString() {
    return 'VoiceNoteEvent.startRecording()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartRecordingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function() pauseRecording,
    required TResult Function() stopRecording,
    required TResult Function() updateDuration,
  }) {
    return startRecording();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function()? pauseRecording,
    TResult? Function()? stopRecording,
    TResult? Function()? updateDuration,
  }) {
    return startRecording?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function()? pauseRecording,
    TResult Function()? stopRecording,
    TResult Function()? updateDuration,
    required TResult orElse(),
  }) {
    if (startRecording != null) {
      return startRecording();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(PauseRecording value) pauseRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateDuration value) updateDuration,
  }) {
    return startRecording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(PauseRecording value)? pauseRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateDuration value)? updateDuration,
  }) {
    return startRecording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(PauseRecording value)? pauseRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateDuration value)? updateDuration,
    required TResult orElse(),
  }) {
    if (startRecording != null) {
      return startRecording(this);
    }
    return orElse();
  }
}

abstract class StartRecording implements VoiceNoteEvent {
  const factory StartRecording() = _$StartRecordingImpl;
}

/// @nodoc
abstract class _$$PauseRecordingImplCopyWith<$Res> {
  factory _$$PauseRecordingImplCopyWith(_$PauseRecordingImpl value,
          $Res Function(_$PauseRecordingImpl) then) =
      __$$PauseRecordingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PauseRecordingImplCopyWithImpl<$Res>
    extends _$VoiceNoteEventCopyWithImpl<$Res, _$PauseRecordingImpl>
    implements _$$PauseRecordingImplCopyWith<$Res> {
  __$$PauseRecordingImplCopyWithImpl(
      _$PauseRecordingImpl _value, $Res Function(_$PauseRecordingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceNoteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PauseRecordingImpl implements PauseRecording {
  const _$PauseRecordingImpl();

  @override
  String toString() {
    return 'VoiceNoteEvent.pauseRecording()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PauseRecordingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function() pauseRecording,
    required TResult Function() stopRecording,
    required TResult Function() updateDuration,
  }) {
    return pauseRecording();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function()? pauseRecording,
    TResult? Function()? stopRecording,
    TResult? Function()? updateDuration,
  }) {
    return pauseRecording?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function()? pauseRecording,
    TResult Function()? stopRecording,
    TResult Function()? updateDuration,
    required TResult orElse(),
  }) {
    if (pauseRecording != null) {
      return pauseRecording();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(PauseRecording value) pauseRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateDuration value) updateDuration,
  }) {
    return pauseRecording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(PauseRecording value)? pauseRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateDuration value)? updateDuration,
  }) {
    return pauseRecording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(PauseRecording value)? pauseRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateDuration value)? updateDuration,
    required TResult orElse(),
  }) {
    if (pauseRecording != null) {
      return pauseRecording(this);
    }
    return orElse();
  }
}

abstract class PauseRecording implements VoiceNoteEvent {
  const factory PauseRecording() = _$PauseRecordingImpl;
}

/// @nodoc
abstract class _$$StopRecordingImplCopyWith<$Res> {
  factory _$$StopRecordingImplCopyWith(
          _$StopRecordingImpl value, $Res Function(_$StopRecordingImpl) then) =
      __$$StopRecordingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopRecordingImplCopyWithImpl<$Res>
    extends _$VoiceNoteEventCopyWithImpl<$Res, _$StopRecordingImpl>
    implements _$$StopRecordingImplCopyWith<$Res> {
  __$$StopRecordingImplCopyWithImpl(
      _$StopRecordingImpl _value, $Res Function(_$StopRecordingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceNoteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopRecordingImpl implements StopRecording {
  const _$StopRecordingImpl();

  @override
  String toString() {
    return 'VoiceNoteEvent.stopRecording()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopRecordingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function() pauseRecording,
    required TResult Function() stopRecording,
    required TResult Function() updateDuration,
  }) {
    return stopRecording();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function()? pauseRecording,
    TResult? Function()? stopRecording,
    TResult? Function()? updateDuration,
  }) {
    return stopRecording?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function()? pauseRecording,
    TResult Function()? stopRecording,
    TResult Function()? updateDuration,
    required TResult orElse(),
  }) {
    if (stopRecording != null) {
      return stopRecording();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(PauseRecording value) pauseRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateDuration value) updateDuration,
  }) {
    return stopRecording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(PauseRecording value)? pauseRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateDuration value)? updateDuration,
  }) {
    return stopRecording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(PauseRecording value)? pauseRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateDuration value)? updateDuration,
    required TResult orElse(),
  }) {
    if (stopRecording != null) {
      return stopRecording(this);
    }
    return orElse();
  }
}

abstract class StopRecording implements VoiceNoteEvent {
  const factory StopRecording() = _$StopRecordingImpl;
}

/// @nodoc
abstract class _$$UpdateDurationImplCopyWith<$Res> {
  factory _$$UpdateDurationImplCopyWith(_$UpdateDurationImpl value,
          $Res Function(_$UpdateDurationImpl) then) =
      __$$UpdateDurationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateDurationImplCopyWithImpl<$Res>
    extends _$VoiceNoteEventCopyWithImpl<$Res, _$UpdateDurationImpl>
    implements _$$UpdateDurationImplCopyWith<$Res> {
  __$$UpdateDurationImplCopyWithImpl(
      _$UpdateDurationImpl _value, $Res Function(_$UpdateDurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceNoteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateDurationImpl implements UpdateDuration {
  const _$UpdateDurationImpl();

  @override
  String toString() {
    return 'VoiceNoteEvent.updateDuration()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateDurationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startRecording,
    required TResult Function() pauseRecording,
    required TResult Function() stopRecording,
    required TResult Function() updateDuration,
  }) {
    return updateDuration();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startRecording,
    TResult? Function()? pauseRecording,
    TResult? Function()? stopRecording,
    TResult? Function()? updateDuration,
  }) {
    return updateDuration?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startRecording,
    TResult Function()? pauseRecording,
    TResult Function()? stopRecording,
    TResult Function()? updateDuration,
    required TResult orElse(),
  }) {
    if (updateDuration != null) {
      return updateDuration();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRecording value) startRecording,
    required TResult Function(PauseRecording value) pauseRecording,
    required TResult Function(StopRecording value) stopRecording,
    required TResult Function(UpdateDuration value) updateDuration,
  }) {
    return updateDuration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRecording value)? startRecording,
    TResult? Function(PauseRecording value)? pauseRecording,
    TResult? Function(StopRecording value)? stopRecording,
    TResult? Function(UpdateDuration value)? updateDuration,
  }) {
    return updateDuration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRecording value)? startRecording,
    TResult Function(PauseRecording value)? pauseRecording,
    TResult Function(StopRecording value)? stopRecording,
    TResult Function(UpdateDuration value)? updateDuration,
    required TResult orElse(),
  }) {
    if (updateDuration != null) {
      return updateDuration(this);
    }
    return orElse();
  }
}

abstract class UpdateDuration implements VoiceNoteEvent {
  const factory UpdateDuration() = _$UpdateDurationImpl;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_trivia_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NumberTriviaViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NumberTrivia trivia) loaded,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NumberTrivia trivia)? loaded,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NumberTrivia trivia)? loaded,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NumberTriviaViewLoaded value) loaded,
    required TResult Function(NumberTriviaViewInitial value) initial,
    required TResult Function(NumberTriviaViewLoading value) loading,
    required TResult Function(NumberTriviaViewError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NumberTriviaViewLoaded value)? loaded,
    TResult? Function(NumberTriviaViewInitial value)? initial,
    TResult? Function(NumberTriviaViewLoading value)? loading,
    TResult? Function(NumberTriviaViewError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NumberTriviaViewLoaded value)? loaded,
    TResult Function(NumberTriviaViewInitial value)? initial,
    TResult Function(NumberTriviaViewLoading value)? loading,
    TResult Function(NumberTriviaViewError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberTriviaViewStateCopyWith<$Res> {
  factory $NumberTriviaViewStateCopyWith(NumberTriviaViewState value,
          $Res Function(NumberTriviaViewState) then) =
      _$NumberTriviaViewStateCopyWithImpl<$Res, NumberTriviaViewState>;
}

/// @nodoc
class _$NumberTriviaViewStateCopyWithImpl<$Res,
        $Val extends NumberTriviaViewState>
    implements $NumberTriviaViewStateCopyWith<$Res> {
  _$NumberTriviaViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NumberTriviaViewLoadedCopyWith<$Res> {
  factory _$$NumberTriviaViewLoadedCopyWith(_$NumberTriviaViewLoaded value,
          $Res Function(_$NumberTriviaViewLoaded) then) =
      __$$NumberTriviaViewLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({NumberTrivia trivia});
}

/// @nodoc
class __$$NumberTriviaViewLoadedCopyWithImpl<$Res>
    extends _$NumberTriviaViewStateCopyWithImpl<$Res, _$NumberTriviaViewLoaded>
    implements _$$NumberTriviaViewLoadedCopyWith<$Res> {
  __$$NumberTriviaViewLoadedCopyWithImpl(_$NumberTriviaViewLoaded _value,
      $Res Function(_$NumberTriviaViewLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trivia = null,
  }) {
    return _then(_$NumberTriviaViewLoaded(
      null == trivia
          ? _value.trivia
          : trivia // ignore: cast_nullable_to_non_nullable
              as NumberTrivia,
    ));
  }
}

/// @nodoc

class _$NumberTriviaViewLoaded
    with DiagnosticableTreeMixin
    implements NumberTriviaViewLoaded {
  const _$NumberTriviaViewLoaded(this.trivia);

  @override
  final NumberTrivia trivia;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NumberTriviaViewState.loaded(trivia: $trivia)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NumberTriviaViewState.loaded'))
      ..add(DiagnosticsProperty('trivia', trivia));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberTriviaViewLoaded &&
            (identical(other.trivia, trivia) || other.trivia == trivia));
  }

  @override
  int get hashCode => Object.hash(runtimeType, trivia);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberTriviaViewLoadedCopyWith<_$NumberTriviaViewLoaded> get copyWith =>
      __$$NumberTriviaViewLoadedCopyWithImpl<_$NumberTriviaViewLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NumberTrivia trivia) loaded,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return loaded(trivia);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NumberTrivia trivia)? loaded,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(trivia);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NumberTrivia trivia)? loaded,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(trivia);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NumberTriviaViewLoaded value) loaded,
    required TResult Function(NumberTriviaViewInitial value) initial,
    required TResult Function(NumberTriviaViewLoading value) loading,
    required TResult Function(NumberTriviaViewError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NumberTriviaViewLoaded value)? loaded,
    TResult? Function(NumberTriviaViewInitial value)? initial,
    TResult? Function(NumberTriviaViewLoading value)? loading,
    TResult? Function(NumberTriviaViewError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NumberTriviaViewLoaded value)? loaded,
    TResult Function(NumberTriviaViewInitial value)? initial,
    TResult Function(NumberTriviaViewLoading value)? loading,
    TResult Function(NumberTriviaViewError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class NumberTriviaViewLoaded implements NumberTriviaViewState {
  const factory NumberTriviaViewLoaded(final NumberTrivia trivia) =
      _$NumberTriviaViewLoaded;

  NumberTrivia get trivia;
  @JsonKey(ignore: true)
  _$$NumberTriviaViewLoadedCopyWith<_$NumberTriviaViewLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NumberTriviaViewInitialCopyWith<$Res> {
  factory _$$NumberTriviaViewInitialCopyWith(_$NumberTriviaViewInitial value,
          $Res Function(_$NumberTriviaViewInitial) then) =
      __$$NumberTriviaViewInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NumberTriviaViewInitialCopyWithImpl<$Res>
    extends _$NumberTriviaViewStateCopyWithImpl<$Res, _$NumberTriviaViewInitial>
    implements _$$NumberTriviaViewInitialCopyWith<$Res> {
  __$$NumberTriviaViewInitialCopyWithImpl(_$NumberTriviaViewInitial _value,
      $Res Function(_$NumberTriviaViewInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NumberTriviaViewInitial
    with DiagnosticableTreeMixin
    implements NumberTriviaViewInitial {
  const _$NumberTriviaViewInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NumberTriviaViewState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NumberTriviaViewState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberTriviaViewInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NumberTrivia trivia) loaded,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NumberTrivia trivia)? loaded,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NumberTrivia trivia)? loaded,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NumberTriviaViewLoaded value) loaded,
    required TResult Function(NumberTriviaViewInitial value) initial,
    required TResult Function(NumberTriviaViewLoading value) loading,
    required TResult Function(NumberTriviaViewError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NumberTriviaViewLoaded value)? loaded,
    TResult? Function(NumberTriviaViewInitial value)? initial,
    TResult? Function(NumberTriviaViewLoading value)? loading,
    TResult? Function(NumberTriviaViewError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NumberTriviaViewLoaded value)? loaded,
    TResult Function(NumberTriviaViewInitial value)? initial,
    TResult Function(NumberTriviaViewLoading value)? loading,
    TResult Function(NumberTriviaViewError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class NumberTriviaViewInitial implements NumberTriviaViewState {
  const factory NumberTriviaViewInitial() = _$NumberTriviaViewInitial;
}

/// @nodoc
abstract class _$$NumberTriviaViewLoadingCopyWith<$Res> {
  factory _$$NumberTriviaViewLoadingCopyWith(_$NumberTriviaViewLoading value,
          $Res Function(_$NumberTriviaViewLoading) then) =
      __$$NumberTriviaViewLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NumberTriviaViewLoadingCopyWithImpl<$Res>
    extends _$NumberTriviaViewStateCopyWithImpl<$Res, _$NumberTriviaViewLoading>
    implements _$$NumberTriviaViewLoadingCopyWith<$Res> {
  __$$NumberTriviaViewLoadingCopyWithImpl(_$NumberTriviaViewLoading _value,
      $Res Function(_$NumberTriviaViewLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NumberTriviaViewLoading
    with DiagnosticableTreeMixin
    implements NumberTriviaViewLoading {
  const _$NumberTriviaViewLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NumberTriviaViewState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NumberTriviaViewState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberTriviaViewLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NumberTrivia trivia) loaded,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NumberTrivia trivia)? loaded,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NumberTrivia trivia)? loaded,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NumberTriviaViewLoaded value) loaded,
    required TResult Function(NumberTriviaViewInitial value) initial,
    required TResult Function(NumberTriviaViewLoading value) loading,
    required TResult Function(NumberTriviaViewError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NumberTriviaViewLoaded value)? loaded,
    TResult? Function(NumberTriviaViewInitial value)? initial,
    TResult? Function(NumberTriviaViewLoading value)? loading,
    TResult? Function(NumberTriviaViewError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NumberTriviaViewLoaded value)? loaded,
    TResult Function(NumberTriviaViewInitial value)? initial,
    TResult Function(NumberTriviaViewLoading value)? loading,
    TResult Function(NumberTriviaViewError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NumberTriviaViewLoading implements NumberTriviaViewState {
  const factory NumberTriviaViewLoading() = _$NumberTriviaViewLoading;
}

/// @nodoc
abstract class _$$NumberTriviaViewErrorCopyWith<$Res> {
  factory _$$NumberTriviaViewErrorCopyWith(_$NumberTriviaViewError value,
          $Res Function(_$NumberTriviaViewError) then) =
      __$$NumberTriviaViewErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NumberTriviaViewErrorCopyWithImpl<$Res>
    extends _$NumberTriviaViewStateCopyWithImpl<$Res, _$NumberTriviaViewError>
    implements _$$NumberTriviaViewErrorCopyWith<$Res> {
  __$$NumberTriviaViewErrorCopyWithImpl(_$NumberTriviaViewError _value,
      $Res Function(_$NumberTriviaViewError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NumberTriviaViewError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NumberTriviaViewError
    with DiagnosticableTreeMixin
    implements NumberTriviaViewError {
  const _$NumberTriviaViewError({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NumberTriviaViewState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NumberTriviaViewState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberTriviaViewError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberTriviaViewErrorCopyWith<_$NumberTriviaViewError> get copyWith =>
      __$$NumberTriviaViewErrorCopyWithImpl<_$NumberTriviaViewError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NumberTrivia trivia) loaded,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NumberTrivia trivia)? loaded,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NumberTrivia trivia)? loaded,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NumberTriviaViewLoaded value) loaded,
    required TResult Function(NumberTriviaViewInitial value) initial,
    required TResult Function(NumberTriviaViewLoading value) loading,
    required TResult Function(NumberTriviaViewError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NumberTriviaViewLoaded value)? loaded,
    TResult? Function(NumberTriviaViewInitial value)? initial,
    TResult? Function(NumberTriviaViewLoading value)? loading,
    TResult? Function(NumberTriviaViewError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NumberTriviaViewLoaded value)? loaded,
    TResult Function(NumberTriviaViewInitial value)? initial,
    TResult Function(NumberTriviaViewLoading value)? loading,
    TResult Function(NumberTriviaViewError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NumberTriviaViewError implements NumberTriviaViewState {
  const factory NumberTriviaViewError({required final String message}) =
      _$NumberTriviaViewError;

  String get message;
  @JsonKey(ignore: true)
  _$$NumberTriviaViewErrorCopyWith<_$NumberTriviaViewError> get copyWith =>
      throw _privateConstructorUsedError;
}

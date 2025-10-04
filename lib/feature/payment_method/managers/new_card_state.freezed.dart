// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CardState {

 String? get errorMessage; bool? get loading; List<CardModel>? get card; int? get selectedId;
/// Create a copy of CardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardStateCopyWith<CardState> get copyWith => _$CardStateCopyWithImpl<CardState>(this as CardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.card, card)&&(identical(other.selectedId, selectedId) || other.selectedId == selectedId));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,loading,const DeepCollectionEquality().hash(card),selectedId);

@override
String toString() {
  return 'CardState(errorMessage: $errorMessage, loading: $loading, card: $card, selectedId: $selectedId)';
}


}

/// @nodoc
abstract mixin class $CardStateCopyWith<$Res>  {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) _then) = _$CardStateCopyWithImpl;
@useResult
$Res call({
 String? errorMessage, bool? loading, List<CardModel>? card, int? selectedId
});




}
/// @nodoc
class _$CardStateCopyWithImpl<$Res>
    implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._self, this._then);

  final CardState _self;
  final $Res Function(CardState) _then;

/// Create a copy of CardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errorMessage = freezed,Object? loading = freezed,Object? card = freezed,Object? selectedId = freezed,}) {
  return _then(_self.copyWith(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,loading: freezed == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool?,card: freezed == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as List<CardModel>?,selectedId: freezed == selectedId ? _self.selectedId : selectedId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CardState].
extension CardStatePatterns on CardState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardState value)  $default,){
final _that = this;
switch (_that) {
case _CardState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardState value)?  $default,){
final _that = this;
switch (_that) {
case _CardState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? errorMessage,  bool? loading,  List<CardModel>? card,  int? selectedId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardState() when $default != null:
return $default(_that.errorMessage,_that.loading,_that.card,_that.selectedId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? errorMessage,  bool? loading,  List<CardModel>? card,  int? selectedId)  $default,) {final _that = this;
switch (_that) {
case _CardState():
return $default(_that.errorMessage,_that.loading,_that.card,_that.selectedId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? errorMessage,  bool? loading,  List<CardModel>? card,  int? selectedId)?  $default,) {final _that = this;
switch (_that) {
case _CardState() when $default != null:
return $default(_that.errorMessage,_that.loading,_that.card,_that.selectedId);case _:
  return null;

}
}

}

/// @nodoc


class _CardState implements CardState {
  const _CardState({this.errorMessage, this.loading, final  List<CardModel>? card, this.selectedId}): _card = card;
  

@override final  String? errorMessage;
@override final  bool? loading;
 final  List<CardModel>? _card;
@override List<CardModel>? get card {
  final value = _card;
  if (value == null) return null;
  if (_card is EqualUnmodifiableListView) return _card;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? selectedId;

/// Create a copy of CardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardStateCopyWith<_CardState> get copyWith => __$CardStateCopyWithImpl<_CardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other._card, _card)&&(identical(other.selectedId, selectedId) || other.selectedId == selectedId));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,loading,const DeepCollectionEquality().hash(_card),selectedId);

@override
String toString() {
  return 'CardState(errorMessage: $errorMessage, loading: $loading, card: $card, selectedId: $selectedId)';
}


}

/// @nodoc
abstract mixin class _$CardStateCopyWith<$Res> implements $CardStateCopyWith<$Res> {
  factory _$CardStateCopyWith(_CardState value, $Res Function(_CardState) _then) = __$CardStateCopyWithImpl;
@override @useResult
$Res call({
 String? errorMessage, bool? loading, List<CardModel>? card, int? selectedId
});




}
/// @nodoc
class __$CardStateCopyWithImpl<$Res>
    implements _$CardStateCopyWith<$Res> {
  __$CardStateCopyWithImpl(this._self, this._then);

  final _CardState _self;
  final $Res Function(_CardState) _then;

/// Create a copy of CardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMessage = freezed,Object? loading = freezed,Object? card = freezed,Object? selectedId = freezed,}) {
  return _then(_CardState(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,loading: freezed == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool?,card: freezed == card ? _self._card : card // ignore: cast_nullable_to_non_nullable
as List<CardModel>?,selectedId: freezed == selectedId ? _self.selectedId : selectedId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on

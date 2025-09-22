// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavedState {

 String? get errorMessage; bool get loading; List<ProductModel> get savedProduct;
/// Create a copy of SavedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedStateCopyWith<SavedState> get copyWith => _$SavedStateCopyWithImpl<SavedState>(this as SavedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.savedProduct, savedProduct));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,loading,const DeepCollectionEquality().hash(savedProduct));

@override
String toString() {
  return 'SavedState(errorMessage: $errorMessage, loading: $loading, savedProduct: $savedProduct)';
}


}

/// @nodoc
abstract mixin class $SavedStateCopyWith<$Res>  {
  factory $SavedStateCopyWith(SavedState value, $Res Function(SavedState) _then) = _$SavedStateCopyWithImpl;
@useResult
$Res call({
 String? errorMessage, bool loading, List<ProductModel> savedProduct
});




}
/// @nodoc
class _$SavedStateCopyWithImpl<$Res>
    implements $SavedStateCopyWith<$Res> {
  _$SavedStateCopyWithImpl(this._self, this._then);

  final SavedState _self;
  final $Res Function(SavedState) _then;

/// Create a copy of SavedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errorMessage = freezed,Object? loading = null,Object? savedProduct = null,}) {
  return _then(_self.copyWith(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,savedProduct: null == savedProduct ? _self.savedProduct : savedProduct // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedState].
extension SavedStatePatterns on SavedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedState value)  $default,){
final _that = this;
switch (_that) {
case _SavedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedState value)?  $default,){
final _that = this;
switch (_that) {
case _SavedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? errorMessage,  bool loading,  List<ProductModel> savedProduct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedState() when $default != null:
return $default(_that.errorMessage,_that.loading,_that.savedProduct);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? errorMessage,  bool loading,  List<ProductModel> savedProduct)  $default,) {final _that = this;
switch (_that) {
case _SavedState():
return $default(_that.errorMessage,_that.loading,_that.savedProduct);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? errorMessage,  bool loading,  List<ProductModel> savedProduct)?  $default,) {final _that = this;
switch (_that) {
case _SavedState() when $default != null:
return $default(_that.errorMessage,_that.loading,_that.savedProduct);case _:
  return null;

}
}

}

/// @nodoc


class _SavedState implements SavedState {
  const _SavedState({this.errorMessage, this.loading = true, final  List<ProductModel> savedProduct = const []}): _savedProduct = savedProduct;
  

@override final  String? errorMessage;
@override@JsonKey() final  bool loading;
 final  List<ProductModel> _savedProduct;
@override@JsonKey() List<ProductModel> get savedProduct {
  if (_savedProduct is EqualUnmodifiableListView) return _savedProduct;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedProduct);
}


/// Create a copy of SavedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedStateCopyWith<_SavedState> get copyWith => __$SavedStateCopyWithImpl<_SavedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other._savedProduct, _savedProduct));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,loading,const DeepCollectionEquality().hash(_savedProduct));

@override
String toString() {
  return 'SavedState(errorMessage: $errorMessage, loading: $loading, savedProduct: $savedProduct)';
}


}

/// @nodoc
abstract mixin class _$SavedStateCopyWith<$Res> implements $SavedStateCopyWith<$Res> {
  factory _$SavedStateCopyWith(_SavedState value, $Res Function(_SavedState) _then) = __$SavedStateCopyWithImpl;
@override @useResult
$Res call({
 String? errorMessage, bool loading, List<ProductModel> savedProduct
});




}
/// @nodoc
class __$SavedStateCopyWithImpl<$Res>
    implements _$SavedStateCopyWith<$Res> {
  __$SavedStateCopyWithImpl(this._self, this._then);

  final _SavedState _self;
  final $Res Function(_SavedState) _then;

/// Create a copy of SavedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMessage = freezed,Object? loading = null,Object? savedProduct = null,}) {
  return _then(_SavedState(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,savedProduct: null == savedProduct ? _self._savedProduct : savedProduct // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailState {

 String? get errorMessage; String? get errorReviews; bool get loading; bool get revLoading; DetailModel get detail; List<ReviewModel> get reviews; ProductSizes? get selectedSize;
/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailStateCopyWith<DetailState> get copyWith => _$DetailStateCopyWithImpl<DetailState>(this as DetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorReviews, errorReviews) || other.errorReviews == errorReviews)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.revLoading, revLoading) || other.revLoading == revLoading)&&(identical(other.detail, detail) || other.detail == detail)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.selectedSize, selectedSize) || other.selectedSize == selectedSize));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,errorReviews,loading,revLoading,detail,const DeepCollectionEquality().hash(reviews),selectedSize);

@override
String toString() {
  return 'DetailState(errorMessage: $errorMessage, errorReviews: $errorReviews, loading: $loading, revLoading: $revLoading, detail: $detail, reviews: $reviews, selectedSize: $selectedSize)';
}


}

/// @nodoc
abstract mixin class $DetailStateCopyWith<$Res>  {
  factory $DetailStateCopyWith(DetailState value, $Res Function(DetailState) _then) = _$DetailStateCopyWithImpl;
@useResult
$Res call({
 String? errorMessage, String? errorReviews, bool loading, bool revLoading, DetailModel detail, List<ReviewModel> reviews, ProductSizes? selectedSize
});




}
/// @nodoc
class _$DetailStateCopyWithImpl<$Res>
    implements $DetailStateCopyWith<$Res> {
  _$DetailStateCopyWithImpl(this._self, this._then);

  final DetailState _self;
  final $Res Function(DetailState) _then;

/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errorMessage = freezed,Object? errorReviews = freezed,Object? loading = null,Object? revLoading = null,Object? detail = null,Object? reviews = null,Object? selectedSize = freezed,}) {
  return _then(_self.copyWith(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorReviews: freezed == errorReviews ? _self.errorReviews : errorReviews // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,revLoading: null == revLoading ? _self.revLoading : revLoading // ignore: cast_nullable_to_non_nullable
as bool,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as DetailModel,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewModel>,selectedSize: freezed == selectedSize ? _self.selectedSize : selectedSize // ignore: cast_nullable_to_non_nullable
as ProductSizes?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailState].
extension DetailStatePatterns on DetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailState value)  $default,){
final _that = this;
switch (_that) {
case _DetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailState value)?  $default,){
final _that = this;
switch (_that) {
case _DetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? errorMessage,  String? errorReviews,  bool loading,  bool revLoading,  DetailModel detail,  List<ReviewModel> reviews,  ProductSizes? selectedSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailState() when $default != null:
return $default(_that.errorMessage,_that.errorReviews,_that.loading,_that.revLoading,_that.detail,_that.reviews,_that.selectedSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? errorMessage,  String? errorReviews,  bool loading,  bool revLoading,  DetailModel detail,  List<ReviewModel> reviews,  ProductSizes? selectedSize)  $default,) {final _that = this;
switch (_that) {
case _DetailState():
return $default(_that.errorMessage,_that.errorReviews,_that.loading,_that.revLoading,_that.detail,_that.reviews,_that.selectedSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? errorMessage,  String? errorReviews,  bool loading,  bool revLoading,  DetailModel detail,  List<ReviewModel> reviews,  ProductSizes? selectedSize)?  $default,) {final _that = this;
switch (_that) {
case _DetailState() when $default != null:
return $default(_that.errorMessage,_that.errorReviews,_that.loading,_that.revLoading,_that.detail,_that.reviews,_that.selectedSize);case _:
  return null;

}
}

}

/// @nodoc


class _DetailState implements DetailState {
  const _DetailState({this.errorMessage, this.errorReviews, required this.loading, required this.revLoading, required this.detail, required final  List<ReviewModel> reviews, this.selectedSize}): _reviews = reviews;
  

@override final  String? errorMessage;
@override final  String? errorReviews;
@override final  bool loading;
@override final  bool revLoading;
@override final  DetailModel detail;
 final  List<ReviewModel> _reviews;
@override List<ReviewModel> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override final  ProductSizes? selectedSize;

/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailStateCopyWith<_DetailState> get copyWith => __$DetailStateCopyWithImpl<_DetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorReviews, errorReviews) || other.errorReviews == errorReviews)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.revLoading, revLoading) || other.revLoading == revLoading)&&(identical(other.detail, detail) || other.detail == detail)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.selectedSize, selectedSize) || other.selectedSize == selectedSize));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,errorReviews,loading,revLoading,detail,const DeepCollectionEquality().hash(_reviews),selectedSize);

@override
String toString() {
  return 'DetailState(errorMessage: $errorMessage, errorReviews: $errorReviews, loading: $loading, revLoading: $revLoading, detail: $detail, reviews: $reviews, selectedSize: $selectedSize)';
}


}

/// @nodoc
abstract mixin class _$DetailStateCopyWith<$Res> implements $DetailStateCopyWith<$Res> {
  factory _$DetailStateCopyWith(_DetailState value, $Res Function(_DetailState) _then) = __$DetailStateCopyWithImpl;
@override @useResult
$Res call({
 String? errorMessage, String? errorReviews, bool loading, bool revLoading, DetailModel detail, List<ReviewModel> reviews, ProductSizes? selectedSize
});




}
/// @nodoc
class __$DetailStateCopyWithImpl<$Res>
    implements _$DetailStateCopyWith<$Res> {
  __$DetailStateCopyWithImpl(this._self, this._then);

  final _DetailState _self;
  final $Res Function(_DetailState) _then;

/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMessage = freezed,Object? errorReviews = freezed,Object? loading = null,Object? revLoading = null,Object? detail = null,Object? reviews = null,Object? selectedSize = freezed,}) {
  return _then(_DetailState(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorReviews: freezed == errorReviews ? _self.errorReviews : errorReviews // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,revLoading: null == revLoading ? _self.revLoading : revLoading // ignore: cast_nullable_to_non_nullable
as bool,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as DetailModel,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewModel>,selectedSize: freezed == selectedSize ? _self.selectedSize : selectedSize // ignore: cast_nullable_to_non_nullable
as ProductSizes?,
  ));
}


}

// dart format on

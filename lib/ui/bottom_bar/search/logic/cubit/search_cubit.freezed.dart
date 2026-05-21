// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState()';
}


}

/// @nodoc
class $SearchStateCopyWith<$Res>  {
$SearchStateCopyWith(SearchState _, $Res Function(SearchState) __);
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _GettingItems value)?  gettingItems,TResult Function( _GetItemsSuccess value)?  getItemsSuccess,TResult Function( _GetItemsError value)?  getItemsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _GettingItems() when gettingItems != null:
return gettingItems(_that);case _GetItemsSuccess() when getItemsSuccess != null:
return getItemsSuccess(_that);case _GetItemsError() when getItemsError != null:
return getItemsError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _GettingItems value)  gettingItems,required TResult Function( _GetItemsSuccess value)  getItemsSuccess,required TResult Function( _GetItemsError value)  getItemsError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _GettingItems():
return gettingItems(_that);case _GetItemsSuccess():
return getItemsSuccess(_that);case _GetItemsError():
return getItemsError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _GettingItems value)?  gettingItems,TResult? Function( _GetItemsSuccess value)?  getItemsSuccess,TResult? Function( _GetItemsError value)?  getItemsError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _GettingItems() when gettingItems != null:
return gettingItems(_that);case _GetItemsSuccess() when getItemsSuccess != null:
return getItemsSuccess(_that);case _GetItemsError() when getItemsError != null:
return getItemsError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  gettingItems,TResult Function( List<Item> items,  int favoriteRevision)?  getItemsSuccess,TResult Function()?  getItemsError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _GettingItems() when gettingItems != null:
return gettingItems();case _GetItemsSuccess() when getItemsSuccess != null:
return getItemsSuccess(_that.items,_that.favoriteRevision);case _GetItemsError() when getItemsError != null:
return getItemsError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  gettingItems,required TResult Function( List<Item> items,  int favoriteRevision)  getItemsSuccess,required TResult Function()  getItemsError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _GettingItems():
return gettingItems();case _GetItemsSuccess():
return getItemsSuccess(_that.items,_that.favoriteRevision);case _GetItemsError():
return getItemsError();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  gettingItems,TResult? Function( List<Item> items,  int favoriteRevision)?  getItemsSuccess,TResult? Function()?  getItemsError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _GettingItems() when gettingItems != null:
return gettingItems();case _GetItemsSuccess() when getItemsSuccess != null:
return getItemsSuccess(_that.items,_that.favoriteRevision);case _GetItemsError() when getItemsError != null:
return getItemsError();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SearchState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.initial()';
}


}




/// @nodoc


class _GettingItems implements SearchState {
  const _GettingItems();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GettingItems);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.gettingItems()';
}


}




/// @nodoc


class _GetItemsSuccess implements SearchState {
  const _GetItemsSuccess({required final  List<Item> items, this.favoriteRevision = 0}): _items = items;
  

 final  List<Item> _items;
 List<Item> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@JsonKey() final  int favoriteRevision;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetItemsSuccessCopyWith<_GetItemsSuccess> get copyWith => __$GetItemsSuccessCopyWithImpl<_GetItemsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetItemsSuccess&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.favoriteRevision, favoriteRevision) || other.favoriteRevision == favoriteRevision));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),favoriteRevision);

@override
String toString() {
  return 'SearchState.getItemsSuccess(items: $items, favoriteRevision: $favoriteRevision)';
}


}

/// @nodoc
abstract mixin class _$GetItemsSuccessCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$GetItemsSuccessCopyWith(_GetItemsSuccess value, $Res Function(_GetItemsSuccess) _then) = __$GetItemsSuccessCopyWithImpl;
@useResult
$Res call({
 List<Item> items, int favoriteRevision
});




}
/// @nodoc
class __$GetItemsSuccessCopyWithImpl<$Res>
    implements _$GetItemsSuccessCopyWith<$Res> {
  __$GetItemsSuccessCopyWithImpl(this._self, this._then);

  final _GetItemsSuccess _self;
  final $Res Function(_GetItemsSuccess) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? favoriteRevision = null,}) {
  return _then(_GetItemsSuccess(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Item>,favoriteRevision: null == favoriteRevision ? _self.favoriteRevision : favoriteRevision // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _GetItemsError implements SearchState {
  const _GetItemsError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetItemsError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.getItemsError()';
}


}




// dart format on

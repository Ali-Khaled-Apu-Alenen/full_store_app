// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _DotsChanging value)?  dotsChanging,TResult Function( _GetCategories value)?  getCategories,TResult Function( _GetItems value)?  getItems,TResult Function( _ChangeFavoriteItem value)?  changeFavoriteItem,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _DotsChanging() when dotsChanging != null:
return dotsChanging(_that);case _GetCategories() when getCategories != null:
return getCategories(_that);case _GetItems() when getItems != null:
return getItems(_that);case _ChangeFavoriteItem() when changeFavoriteItem != null:
return changeFavoriteItem(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _DotsChanging value)  dotsChanging,required TResult Function( _GetCategories value)  getCategories,required TResult Function( _GetItems value)  getItems,required TResult Function( _ChangeFavoriteItem value)  changeFavoriteItem,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _DotsChanging():
return dotsChanging(_that);case _GetCategories():
return getCategories(_that);case _GetItems():
return getItems(_that);case _ChangeFavoriteItem():
return changeFavoriteItem(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _DotsChanging value)?  dotsChanging,TResult? Function( _GetCategories value)?  getCategories,TResult? Function( _GetItems value)?  getItems,TResult? Function( _ChangeFavoriteItem value)?  changeFavoriteItem,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _DotsChanging() when dotsChanging != null:
return dotsChanging(_that);case _GetCategories() when getCategories != null:
return getCategories(_that);case _GetItems() when getItems != null:
return getItems(_that);case _ChangeFavoriteItem() when changeFavoriteItem != null:
return changeFavoriteItem(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int index)?  dotsChanging,TResult Function()?  getCategories,TResult Function()?  getItems,TResult Function( int itemId,  bool isFavorite)?  changeFavoriteItem,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _DotsChanging() when dotsChanging != null:
return dotsChanging(_that.index);case _GetCategories() when getCategories != null:
return getCategories();case _GetItems() when getItems != null:
return getItems();case _ChangeFavoriteItem() when changeFavoriteItem != null:
return changeFavoriteItem(_that.itemId,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int index)  dotsChanging,required TResult Function()  getCategories,required TResult Function()  getItems,required TResult Function( int itemId,  bool isFavorite)  changeFavoriteItem,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _DotsChanging():
return dotsChanging(_that.index);case _GetCategories():
return getCategories();case _GetItems():
return getItems();case _ChangeFavoriteItem():
return changeFavoriteItem(_that.itemId,_that.isFavorite);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int index)?  dotsChanging,TResult? Function()?  getCategories,TResult? Function()?  getItems,TResult? Function( int itemId,  bool isFavorite)?  changeFavoriteItem,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _DotsChanging() when dotsChanging != null:
return dotsChanging(_that.index);case _GetCategories() when getCategories != null:
return getCategories();case _GetItems() when getItems != null:
return getItems();case _ChangeFavoriteItem() when changeFavoriteItem != null:
return changeFavoriteItem(_that.itemId,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc


class _Started with DiagnosticableTreeMixin implements HomeEvent {
  const _Started();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.started'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.started()';
}


}




/// @nodoc


class _DotsChanging with DiagnosticableTreeMixin implements HomeEvent {
  const _DotsChanging(this.index);
  

 final  int index;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DotsChangingCopyWith<_DotsChanging> get copyWith => __$DotsChangingCopyWithImpl<_DotsChanging>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.dotsChanging'))
    ..add(DiagnosticsProperty('index', index));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DotsChanging&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.dotsChanging(index: $index)';
}


}

/// @nodoc
abstract mixin class _$DotsChangingCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$DotsChangingCopyWith(_DotsChanging value, $Res Function(_DotsChanging) _then) = __$DotsChangingCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$DotsChangingCopyWithImpl<$Res>
    implements _$DotsChangingCopyWith<$Res> {
  __$DotsChangingCopyWithImpl(this._self, this._then);

  final _DotsChanging _self;
  final $Res Function(_DotsChanging) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_DotsChanging(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _GetCategories with DiagnosticableTreeMixin implements HomeEvent {
  const _GetCategories();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.getCategories'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCategories);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.getCategories()';
}


}




/// @nodoc


class _GetItems with DiagnosticableTreeMixin implements HomeEvent {
  const _GetItems();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.getItems'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetItems);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.getItems()';
}


}




/// @nodoc


class _ChangeFavoriteItem with DiagnosticableTreeMixin implements HomeEvent {
  const _ChangeFavoriteItem(this.itemId, this.isFavorite);
  

 final  int itemId;
 final  bool isFavorite;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeFavoriteItemCopyWith<_ChangeFavoriteItem> get copyWith => __$ChangeFavoriteItemCopyWithImpl<_ChangeFavoriteItem>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.changeFavoriteItem'))
    ..add(DiagnosticsProperty('itemId', itemId))..add(DiagnosticsProperty('isFavorite', isFavorite));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeFavoriteItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,isFavorite);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.changeFavoriteItem(itemId: $itemId, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$ChangeFavoriteItemCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ChangeFavoriteItemCopyWith(_ChangeFavoriteItem value, $Res Function(_ChangeFavoriteItem) _then) = __$ChangeFavoriteItemCopyWithImpl;
@useResult
$Res call({
 int itemId, bool isFavorite
});




}
/// @nodoc
class __$ChangeFavoriteItemCopyWithImpl<$Res>
    implements _$ChangeFavoriteItemCopyWith<$Res> {
  __$ChangeFavoriteItemCopyWithImpl(this._self, this._then);

  final _ChangeFavoriteItem _self;
  final $Res Function(_ChangeFavoriteItem) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? isFavorite = null,}) {
  return _then(_ChangeFavoriteItem(
null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$HomeState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _DotsChangingState value)?  dotsChanging,TResult Function( _GetCategoriesLoading value)?  getCategoriesLoading,TResult Function( _GetCategoriesSuccess value)?  getCategoriesSuccess,TResult Function( _GetCategoriesError value)?  getCategoriesError,TResult Function( _GetItemsLoading value)?  getItemsLoading,TResult Function( _GetItemsSuccess value)?  getItemsSuccess,TResult Function( _GetItemsError value)?  getItemsError,TResult Function( _ChangeFavoriteItemState value)?  changeFavoriteItem,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _DotsChangingState() when dotsChanging != null:
return dotsChanging(_that);case _GetCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading(_that);case _GetCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that);case _GetCategoriesError() when getCategoriesError != null:
return getCategoriesError(_that);case _GetItemsLoading() when getItemsLoading != null:
return getItemsLoading(_that);case _GetItemsSuccess() when getItemsSuccess != null:
return getItemsSuccess(_that);case _GetItemsError() when getItemsError != null:
return getItemsError(_that);case _ChangeFavoriteItemState() when changeFavoriteItem != null:
return changeFavoriteItem(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _DotsChangingState value)  dotsChanging,required TResult Function( _GetCategoriesLoading value)  getCategoriesLoading,required TResult Function( _GetCategoriesSuccess value)  getCategoriesSuccess,required TResult Function( _GetCategoriesError value)  getCategoriesError,required TResult Function( _GetItemsLoading value)  getItemsLoading,required TResult Function( _GetItemsSuccess value)  getItemsSuccess,required TResult Function( _GetItemsError value)  getItemsError,required TResult Function( _ChangeFavoriteItemState value)  changeFavoriteItem,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _DotsChangingState():
return dotsChanging(_that);case _GetCategoriesLoading():
return getCategoriesLoading(_that);case _GetCategoriesSuccess():
return getCategoriesSuccess(_that);case _GetCategoriesError():
return getCategoriesError(_that);case _GetItemsLoading():
return getItemsLoading(_that);case _GetItemsSuccess():
return getItemsSuccess(_that);case _GetItemsError():
return getItemsError(_that);case _ChangeFavoriteItemState():
return changeFavoriteItem(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _DotsChangingState value)?  dotsChanging,TResult? Function( _GetCategoriesLoading value)?  getCategoriesLoading,TResult? Function( _GetCategoriesSuccess value)?  getCategoriesSuccess,TResult? Function( _GetCategoriesError value)?  getCategoriesError,TResult? Function( _GetItemsLoading value)?  getItemsLoading,TResult? Function( _GetItemsSuccess value)?  getItemsSuccess,TResult? Function( _GetItemsError value)?  getItemsError,TResult? Function( _ChangeFavoriteItemState value)?  changeFavoriteItem,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _DotsChangingState() when dotsChanging != null:
return dotsChanging(_that);case _GetCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading(_that);case _GetCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that);case _GetCategoriesError() when getCategoriesError != null:
return getCategoriesError(_that);case _GetItemsLoading() when getItemsLoading != null:
return getItemsLoading(_that);case _GetItemsSuccess() when getItemsSuccess != null:
return getItemsSuccess(_that);case _GetItemsError() when getItemsError != null:
return getItemsError(_that);case _ChangeFavoriteItemState() when changeFavoriteItem != null:
return changeFavoriteItem(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int index)?  dotsChanging,TResult Function()?  getCategoriesLoading,TResult Function( CategorieResponseData data)?  getCategoriesSuccess,TResult Function()?  getCategoriesError,TResult Function()?  getItemsLoading,TResult Function( ItemsResponseData data)?  getItemsSuccess,TResult Function()?  getItemsError,TResult Function( int itemId,  bool isFavorite)?  changeFavoriteItem,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _DotsChangingState() when dotsChanging != null:
return dotsChanging(_that.index);case _GetCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading();case _GetCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that.data);case _GetCategoriesError() when getCategoriesError != null:
return getCategoriesError();case _GetItemsLoading() when getItemsLoading != null:
return getItemsLoading();case _GetItemsSuccess() when getItemsSuccess != null:
return getItemsSuccess(_that.data);case _GetItemsError() when getItemsError != null:
return getItemsError();case _ChangeFavoriteItemState() when changeFavoriteItem != null:
return changeFavoriteItem(_that.itemId,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int index)  dotsChanging,required TResult Function()  getCategoriesLoading,required TResult Function( CategorieResponseData data)  getCategoriesSuccess,required TResult Function()  getCategoriesError,required TResult Function()  getItemsLoading,required TResult Function( ItemsResponseData data)  getItemsSuccess,required TResult Function()  getItemsError,required TResult Function( int itemId,  bool isFavorite)  changeFavoriteItem,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _DotsChangingState():
return dotsChanging(_that.index);case _GetCategoriesLoading():
return getCategoriesLoading();case _GetCategoriesSuccess():
return getCategoriesSuccess(_that.data);case _GetCategoriesError():
return getCategoriesError();case _GetItemsLoading():
return getItemsLoading();case _GetItemsSuccess():
return getItemsSuccess(_that.data);case _GetItemsError():
return getItemsError();case _ChangeFavoriteItemState():
return changeFavoriteItem(_that.itemId,_that.isFavorite);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int index)?  dotsChanging,TResult? Function()?  getCategoriesLoading,TResult? Function( CategorieResponseData data)?  getCategoriesSuccess,TResult? Function()?  getCategoriesError,TResult? Function()?  getItemsLoading,TResult? Function( ItemsResponseData data)?  getItemsSuccess,TResult? Function()?  getItemsError,TResult? Function( int itemId,  bool isFavorite)?  changeFavoriteItem,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _DotsChangingState() when dotsChanging != null:
return dotsChanging(_that.index);case _GetCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading();case _GetCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that.data);case _GetCategoriesError() when getCategoriesError != null:
return getCategoriesError();case _GetItemsLoading() when getItemsLoading != null:
return getItemsLoading();case _GetItemsSuccess() when getItemsSuccess != null:
return getItemsSuccess(_that.data);case _GetItemsError() when getItemsError != null:
return getItemsError();case _ChangeFavoriteItemState() when changeFavoriteItem != null:
return changeFavoriteItem(_that.itemId,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc


class _Initial with DiagnosticableTreeMixin implements HomeState {
  const _Initial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.initial()';
}


}




/// @nodoc


class _DotsChangingState with DiagnosticableTreeMixin implements HomeState {
  const _DotsChangingState(this.index);
  

 final  int index;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DotsChangingStateCopyWith<_DotsChangingState> get copyWith => __$DotsChangingStateCopyWithImpl<_DotsChangingState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.dotsChanging'))
    ..add(DiagnosticsProperty('index', index));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DotsChangingState&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.dotsChanging(index: $index)';
}


}

/// @nodoc
abstract mixin class _$DotsChangingStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$DotsChangingStateCopyWith(_DotsChangingState value, $Res Function(_DotsChangingState) _then) = __$DotsChangingStateCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$DotsChangingStateCopyWithImpl<$Res>
    implements _$DotsChangingStateCopyWith<$Res> {
  __$DotsChangingStateCopyWithImpl(this._self, this._then);

  final _DotsChangingState _self;
  final $Res Function(_DotsChangingState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_DotsChangingState(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _GetCategoriesLoading with DiagnosticableTreeMixin implements HomeState {
  const _GetCategoriesLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.getCategoriesLoading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCategoriesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.getCategoriesLoading()';
}


}




/// @nodoc


class _GetCategoriesSuccess with DiagnosticableTreeMixin implements HomeState {
  const _GetCategoriesSuccess(this.data);
  

 final  CategorieResponseData data;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCategoriesSuccessCopyWith<_GetCategoriesSuccess> get copyWith => __$GetCategoriesSuccessCopyWithImpl<_GetCategoriesSuccess>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.getCategoriesSuccess'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCategoriesSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.getCategoriesSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class _$GetCategoriesSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$GetCategoriesSuccessCopyWith(_GetCategoriesSuccess value, $Res Function(_GetCategoriesSuccess) _then) = __$GetCategoriesSuccessCopyWithImpl;
@useResult
$Res call({
 CategorieResponseData data
});




}
/// @nodoc
class __$GetCategoriesSuccessCopyWithImpl<$Res>
    implements _$GetCategoriesSuccessCopyWith<$Res> {
  __$GetCategoriesSuccessCopyWithImpl(this._self, this._then);

  final _GetCategoriesSuccess _self;
  final $Res Function(_GetCategoriesSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_GetCategoriesSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CategorieResponseData,
  ));
}


}

/// @nodoc


class _GetCategoriesError with DiagnosticableTreeMixin implements HomeState {
  const _GetCategoriesError();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.getCategoriesError'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCategoriesError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.getCategoriesError()';
}


}




/// @nodoc


class _GetItemsLoading with DiagnosticableTreeMixin implements HomeState {
  const _GetItemsLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.getItemsLoading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetItemsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.getItemsLoading()';
}


}




/// @nodoc


class _GetItemsSuccess with DiagnosticableTreeMixin implements HomeState {
  const _GetItemsSuccess(this.data);
  

 final  ItemsResponseData data;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetItemsSuccessCopyWith<_GetItemsSuccess> get copyWith => __$GetItemsSuccessCopyWithImpl<_GetItemsSuccess>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.getItemsSuccess'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetItemsSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.getItemsSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class _$GetItemsSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$GetItemsSuccessCopyWith(_GetItemsSuccess value, $Res Function(_GetItemsSuccess) _then) = __$GetItemsSuccessCopyWithImpl;
@useResult
$Res call({
 ItemsResponseData data
});




}
/// @nodoc
class __$GetItemsSuccessCopyWithImpl<$Res>
    implements _$GetItemsSuccessCopyWith<$Res> {
  __$GetItemsSuccessCopyWithImpl(this._self, this._then);

  final _GetItemsSuccess _self;
  final $Res Function(_GetItemsSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_GetItemsSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ItemsResponseData,
  ));
}


}

/// @nodoc


class _GetItemsError with DiagnosticableTreeMixin implements HomeState {
  const _GetItemsError();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.getItemsError'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetItemsError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.getItemsError()';
}


}




/// @nodoc


class _ChangeFavoriteItemState with DiagnosticableTreeMixin implements HomeState {
  const _ChangeFavoriteItemState(this.itemId, this.isFavorite);
  

 final  int itemId;
 final  bool isFavorite;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeFavoriteItemStateCopyWith<_ChangeFavoriteItemState> get copyWith => __$ChangeFavoriteItemStateCopyWithImpl<_ChangeFavoriteItemState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.changeFavoriteItem'))
    ..add(DiagnosticsProperty('itemId', itemId))..add(DiagnosticsProperty('isFavorite', isFavorite));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeFavoriteItemState&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,isFavorite);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.changeFavoriteItem(itemId: $itemId, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$ChangeFavoriteItemStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$ChangeFavoriteItemStateCopyWith(_ChangeFavoriteItemState value, $Res Function(_ChangeFavoriteItemState) _then) = __$ChangeFavoriteItemStateCopyWithImpl;
@useResult
$Res call({
 int itemId, bool isFavorite
});




}
/// @nodoc
class __$ChangeFavoriteItemStateCopyWithImpl<$Res>
    implements _$ChangeFavoriteItemStateCopyWith<$Res> {
  __$ChangeFavoriteItemStateCopyWithImpl(this._self, this._then);

  final _ChangeFavoriteItemState _self;
  final $Res Function(_ChangeFavoriteItemState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? isFavorite = null,}) {
  return _then(_ChangeFavoriteItemState(
null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

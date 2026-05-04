// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState<$T>()';
}


}

/// @nodoc
class $LoginStateCopyWith<T,$Res>  {
$LoginStateCopyWith(LoginState<T> _, $Res Function(LoginState<T>) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns<T> on LoginState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( _Loading<T> value)?  loading,TResult Function( _Success<T> value)?  success,TResult Function( _Failure<T> value)?  failure,TResult Function( _TogglePassword<T> value)?  togglePassword,TResult Function( _ToggleRememberMe<T> value)?  toggleRememberMe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _TogglePassword() when togglePassword != null:
return togglePassword(_that);case _ToggleRememberMe() when toggleRememberMe != null:
return toggleRememberMe(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( _Loading<T> value)  loading,required TResult Function( _Success<T> value)  success,required TResult Function( _Failure<T> value)  failure,required TResult Function( _TogglePassword<T> value)  togglePassword,required TResult Function( _ToggleRememberMe<T> value)  toggleRememberMe,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _TogglePassword():
return togglePassword(_that);case _ToggleRememberMe():
return toggleRememberMe(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( _Loading<T> value)?  loading,TResult? Function( _Success<T> value)?  success,TResult? Function( _Failure<T> value)?  failure,TResult? Function( _TogglePassword<T> value)?  togglePassword,TResult? Function( _ToggleRememberMe<T> value)?  toggleRememberMe,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _TogglePassword() when togglePassword != null:
return togglePassword(_that);case _ToggleRememberMe() when toggleRememberMe != null:
return toggleRememberMe(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  success,TResult Function( String message)?  failure,TResult Function( bool passwordVisible)?  togglePassword,TResult Function( bool rememberMe)?  toggleRememberMe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.data);case _Failure() when failure != null:
return failure(_that.message);case _TogglePassword() when togglePassword != null:
return togglePassword(_that.passwordVisible);case _ToggleRememberMe() when toggleRememberMe != null:
return toggleRememberMe(_that.rememberMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  success,required TResult Function( String message)  failure,required TResult Function( bool passwordVisible)  togglePassword,required TResult Function( bool rememberMe)  toggleRememberMe,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.data);case _Failure():
return failure(_that.message);case _TogglePassword():
return togglePassword(_that.passwordVisible);case _ToggleRememberMe():
return toggleRememberMe(_that.rememberMe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  success,TResult? Function( String message)?  failure,TResult? Function( bool passwordVisible)?  togglePassword,TResult? Function( bool rememberMe)?  toggleRememberMe,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.data);case _Failure() when failure != null:
return failure(_that.message);case _TogglePassword() when togglePassword != null:
return togglePassword(_that.passwordVisible);case _ToggleRememberMe() when toggleRememberMe != null:
return toggleRememberMe(_that.rememberMe);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements LoginState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState<$T>.initial()';
}


}




/// @nodoc


class _Loading<T> implements LoginState<T> {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState<$T>.loading()';
}


}




/// @nodoc


class _Success<T> implements LoginState<T> {
  const _Success(this.data);
  

 final  T data;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<T, _Success<T>> get copyWith => __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'LoginState<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<T,$Res> implements $LoginStateCopyWith<T, $Res> {
  factory _$SuccessCopyWith(_Success<T> value, $Res Function(_Success<T>) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class __$SuccessCopyWithImpl<T,$Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success<T> _self;
  final $Res Function(_Success<T>) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_Success<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _Failure<T> implements LoginState<T> {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<T, _Failure<T>> get copyWith => __$FailureCopyWithImpl<T, _Failure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginState<$T>.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<T,$Res> implements $LoginStateCopyWith<T, $Res> {
  factory _$FailureCopyWith(_Failure<T> value, $Res Function(_Failure<T>) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<T,$Res>
    implements _$FailureCopyWith<T, $Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure<T> _self;
  final $Res Function(_Failure<T>) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TogglePassword<T> implements LoginState<T> {
  const _TogglePassword(this.passwordVisible);
  

 final  bool passwordVisible;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TogglePasswordCopyWith<T, _TogglePassword<T>> get copyWith => __$TogglePasswordCopyWithImpl<T, _TogglePassword<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TogglePassword<T>&&(identical(other.passwordVisible, passwordVisible) || other.passwordVisible == passwordVisible));
}


@override
int get hashCode => Object.hash(runtimeType,passwordVisible);

@override
String toString() {
  return 'LoginState<$T>.togglePassword(passwordVisible: $passwordVisible)';
}


}

/// @nodoc
abstract mixin class _$TogglePasswordCopyWith<T,$Res> implements $LoginStateCopyWith<T, $Res> {
  factory _$TogglePasswordCopyWith(_TogglePassword<T> value, $Res Function(_TogglePassword<T>) _then) = __$TogglePasswordCopyWithImpl;
@useResult
$Res call({
 bool passwordVisible
});




}
/// @nodoc
class __$TogglePasswordCopyWithImpl<T,$Res>
    implements _$TogglePasswordCopyWith<T, $Res> {
  __$TogglePasswordCopyWithImpl(this._self, this._then);

  final _TogglePassword<T> _self;
  final $Res Function(_TogglePassword<T>) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? passwordVisible = null,}) {
  return _then(_TogglePassword<T>(
null == passwordVisible ? _self.passwordVisible : passwordVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ToggleRememberMe<T> implements LoginState<T> {
  const _ToggleRememberMe(this.rememberMe);
  

 final  bool rememberMe;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleRememberMeCopyWith<T, _ToggleRememberMe<T>> get copyWith => __$ToggleRememberMeCopyWithImpl<T, _ToggleRememberMe<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleRememberMe<T>&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe));
}


@override
int get hashCode => Object.hash(runtimeType,rememberMe);

@override
String toString() {
  return 'LoginState<$T>.toggleRememberMe(rememberMe: $rememberMe)';
}


}

/// @nodoc
abstract mixin class _$ToggleRememberMeCopyWith<T,$Res> implements $LoginStateCopyWith<T, $Res> {
  factory _$ToggleRememberMeCopyWith(_ToggleRememberMe<T> value, $Res Function(_ToggleRememberMe<T>) _then) = __$ToggleRememberMeCopyWithImpl;
@useResult
$Res call({
 bool rememberMe
});




}
/// @nodoc
class __$ToggleRememberMeCopyWithImpl<T,$Res>
    implements _$ToggleRememberMeCopyWith<T, $Res> {
  __$ToggleRememberMeCopyWithImpl(this._self, this._then);

  final _ToggleRememberMe<T> _self;
  final $Res Function(_ToggleRememberMe<T>) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rememberMe = null,}) {
  return _then(_ToggleRememberMe<T>(
null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

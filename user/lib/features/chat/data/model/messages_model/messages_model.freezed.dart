// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessagesModel _$MessagesModelFromJson(Map<String, dynamic> json) {
  return _MessagesModel.fromJson(json);
}

/// @nodoc
mixin _$MessagesModel {
  int get pageNumber => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalDataCount => throw _privateConstructorUsedError;
  List<Data> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessagesModelCopyWith<MessagesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesModelCopyWith<$Res> {
  factory $MessagesModelCopyWith(
          MessagesModel value, $Res Function(MessagesModel) then) =
      _$MessagesModelCopyWithImpl<$Res, MessagesModel>;
  @useResult
  $Res call(
      {int pageNumber, int totalPages, int totalDataCount, List<Data> data});
}

/// @nodoc
class _$MessagesModelCopyWithImpl<$Res, $Val extends MessagesModel>
    implements $MessagesModelCopyWith<$Res> {
  _$MessagesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? totalPages = null,
    Object? totalDataCount = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalDataCount: null == totalDataCount
          ? _value.totalDataCount
          : totalDataCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessagesModelImplCopyWith<$Res>
    implements $MessagesModelCopyWith<$Res> {
  factory _$$MessagesModelImplCopyWith(
          _$MessagesModelImpl value, $Res Function(_$MessagesModelImpl) then) =
      __$$MessagesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int pageNumber, int totalPages, int totalDataCount, List<Data> data});
}

/// @nodoc
class __$$MessagesModelImplCopyWithImpl<$Res>
    extends _$MessagesModelCopyWithImpl<$Res, _$MessagesModelImpl>
    implements _$$MessagesModelImplCopyWith<$Res> {
  __$$MessagesModelImplCopyWithImpl(
      _$MessagesModelImpl _value, $Res Function(_$MessagesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? totalPages = null,
    Object? totalDataCount = null,
    Object? data = null,
  }) {
    return _then(_$MessagesModelImpl(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalDataCount: null == totalDataCount
          ? _value.totalDataCount
          : totalDataCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessagesModelImpl implements _MessagesModel {
  const _$MessagesModelImpl(
      {required this.pageNumber,
      required this.totalPages,
      required this.totalDataCount,
      required final List<Data> data})
      : _data = data;

  factory _$MessagesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessagesModelImplFromJson(json);

  @override
  final int pageNumber;
  @override
  final int totalPages;
  @override
  final int totalDataCount;
  final List<Data> _data;
  @override
  List<Data> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MessagesModel(pageNumber: $pageNumber, totalPages: $totalPages, totalDataCount: $totalDataCount, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesModelImpl &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalDataCount, totalDataCount) ||
                other.totalDataCount == totalDataCount) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pageNumber, totalPages,
      totalDataCount, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagesModelImplCopyWith<_$MessagesModelImpl> get copyWith =>
      __$$MessagesModelImplCopyWithImpl<_$MessagesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessagesModelImplToJson(
      this,
    );
  }
}

abstract class _MessagesModel implements MessagesModel {
  const factory _MessagesModel(
      {required final int pageNumber,
      required final int totalPages,
      required final int totalDataCount,
      required final List<Data> data}) = _$MessagesModelImpl;

  factory _MessagesModel.fromJson(Map<String, dynamic> json) =
      _$MessagesModelImpl.fromJson;

  @override
  int get pageNumber;
  @override
  int get totalPages;
  @override
  int get totalDataCount;
  @override
  List<Data> get data;
  @override
  @JsonKey(ignore: true)
  _$$MessagesModelImplCopyWith<_$MessagesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get datumId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String content,
      String user,
      DateTime createdAt,
      String datumId});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? user = null,
    Object? createdAt = null,
    Object? datumId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      datumId: null == datumId
          ? _value.datumId
          : datumId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String content,
      String user,
      DateTime createdAt,
      String datumId});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? user = null,
    Object? createdAt = null,
    Object? datumId = null,
  }) {
    return _then(_$DataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      datumId: null == datumId
          ? _value.datumId
          : datumId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.content,
      required this.user,
      required this.createdAt,
      required this.datumId});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String content;
  @override
  final String user;
  @override
  final DateTime createdAt;
  @override
  final String datumId;

  @override
  String toString() {
    return 'Data(id: $id, content: $content, user: $user, createdAt: $createdAt, datumId: $datumId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.datumId, datumId) || other.datumId == datumId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, user, createdAt, datumId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {@JsonKey(name: '_id') required final String id,
      required final String content,
      required final String user,
      required final DateTime createdAt,
      required final String datumId}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get content;
  @override
  String get user;
  @override
  DateTime get createdAt;
  @override
  String get datumId;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

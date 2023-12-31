// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchases_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchasesModel _$PurchasesModelFromJson(Map<String, dynamic> json) {
  return _PurchasesModel.fromJson(json);
}

/// @nodoc
mixin _$PurchasesModel {
  List<CustomerElement> get wait => throw _privateConstructorUsedError;
  List<CustomerElement> get seller => throw _privateConstructorUsedError;
  List<CustomerElement> get customer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchasesModelCopyWith<PurchasesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasesModelCopyWith<$Res> {
  factory $PurchasesModelCopyWith(
          PurchasesModel value, $Res Function(PurchasesModel) then) =
      _$PurchasesModelCopyWithImpl<$Res, PurchasesModel>;
  @useResult
  $Res call(
      {List<CustomerElement> wait,
      List<CustomerElement> seller,
      List<CustomerElement> customer});
}

/// @nodoc
class _$PurchasesModelCopyWithImpl<$Res, $Val extends PurchasesModel>
    implements $PurchasesModelCopyWith<$Res> {
  _$PurchasesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wait = null,
    Object? seller = null,
    Object? customer = null,
  }) {
    return _then(_value.copyWith(
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as List<CustomerElement>,
      seller: null == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as List<CustomerElement>,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as List<CustomerElement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchasesModelImplCopyWith<$Res>
    implements $PurchasesModelCopyWith<$Res> {
  factory _$$PurchasesModelImplCopyWith(_$PurchasesModelImpl value,
          $Res Function(_$PurchasesModelImpl) then) =
      __$$PurchasesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CustomerElement> wait,
      List<CustomerElement> seller,
      List<CustomerElement> customer});
}

/// @nodoc
class __$$PurchasesModelImplCopyWithImpl<$Res>
    extends _$PurchasesModelCopyWithImpl<$Res, _$PurchasesModelImpl>
    implements _$$PurchasesModelImplCopyWith<$Res> {
  __$$PurchasesModelImplCopyWithImpl(
      _$PurchasesModelImpl _value, $Res Function(_$PurchasesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wait = null,
    Object? seller = null,
    Object? customer = null,
  }) {
    return _then(_$PurchasesModelImpl(
      wait: null == wait
          ? _value._wait
          : wait // ignore: cast_nullable_to_non_nullable
              as List<CustomerElement>,
      seller: null == seller
          ? _value._seller
          : seller // ignore: cast_nullable_to_non_nullable
              as List<CustomerElement>,
      customer: null == customer
          ? _value._customer
          : customer // ignore: cast_nullable_to_non_nullable
              as List<CustomerElement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchasesModelImpl implements _PurchasesModel {
  const _$PurchasesModelImpl(
      {required final List<CustomerElement> wait,
      required final List<CustomerElement> seller,
      required final List<CustomerElement> customer})
      : _wait = wait,
        _seller = seller,
        _customer = customer;

  factory _$PurchasesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchasesModelImplFromJson(json);

  final List<CustomerElement> _wait;
  @override
  List<CustomerElement> get wait {
    if (_wait is EqualUnmodifiableListView) return _wait;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wait);
  }

  final List<CustomerElement> _seller;
  @override
  List<CustomerElement> get seller {
    if (_seller is EqualUnmodifiableListView) return _seller;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seller);
  }

  final List<CustomerElement> _customer;
  @override
  List<CustomerElement> get customer {
    if (_customer is EqualUnmodifiableListView) return _customer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customer);
  }

  @override
  String toString() {
    return 'PurchasesModel(wait: $wait, seller: $seller, customer: $customer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchasesModelImpl &&
            const DeepCollectionEquality().equals(other._wait, _wait) &&
            const DeepCollectionEquality().equals(other._seller, _seller) &&
            const DeepCollectionEquality().equals(other._customer, _customer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wait),
      const DeepCollectionEquality().hash(_seller),
      const DeepCollectionEquality().hash(_customer));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchasesModelImplCopyWith<_$PurchasesModelImpl> get copyWith =>
      __$$PurchasesModelImplCopyWithImpl<_$PurchasesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchasesModelImplToJson(
      this,
    );
  }
}

abstract class _PurchasesModel implements PurchasesModel {
  const factory _PurchasesModel(
      {required final List<CustomerElement> wait,
      required final List<CustomerElement> seller,
      required final List<CustomerElement> customer}) = _$PurchasesModelImpl;

  factory _PurchasesModel.fromJson(Map<String, dynamic> json) =
      _$PurchasesModelImpl.fromJson;

  @override
  List<CustomerElement> get wait;
  @override
  List<CustomerElement> get seller;
  @override
  List<CustomerElement> get customer;
  @override
  @JsonKey(ignore: true)
  _$$PurchasesModelImplCopyWith<_$PurchasesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerElement _$CustomerElementFromJson(Map<String, dynamic> json) {
  return _CustomerElement.fromJson(json);
}

/// @nodoc
mixin _$CustomerElement {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  Payment get payment => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_date')
  DateTime? get customerDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'seller_date')
  DateTime? get sellerDate => throw _privateConstructorUsedError;
  Unpaid get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerElementCopyWith<CustomerElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerElementCopyWith<$Res> {
  factory $CustomerElementCopyWith(
          CustomerElement value, $Res Function(CustomerElement) then) =
      _$CustomerElementCopyWithImpl<$Res, CustomerElement>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      Payment payment,
      @JsonKey(name: 'customer_date') DateTime? customerDate,
      @JsonKey(name: 'seller_date') DateTime? sellerDate,
      Unpaid product});

  $PaymentCopyWith<$Res> get payment;
  $UnpaidCopyWith<$Res> get product;
}

/// @nodoc
class _$CustomerElementCopyWithImpl<$Res, $Val extends CustomerElement>
    implements $CustomerElementCopyWith<$Res> {
  _$CustomerElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? payment = null,
    Object? customerDate = freezed,
    Object? sellerDate = freezed,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment,
      customerDate: freezed == customerDate
          ? _value.customerDate
          : customerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sellerDate: freezed == sellerDate
          ? _value.sellerDate
          : sellerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Unpaid,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentCopyWith<$Res> get payment {
    return $PaymentCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnpaidCopyWith<$Res> get product {
    return $UnpaidCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerElementImplCopyWith<$Res>
    implements $CustomerElementCopyWith<$Res> {
  factory _$$CustomerElementImplCopyWith(_$CustomerElementImpl value,
          $Res Function(_$CustomerElementImpl) then) =
      __$$CustomerElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      Payment payment,
      @JsonKey(name: 'customer_date') DateTime? customerDate,
      @JsonKey(name: 'seller_date') DateTime? sellerDate,
      Unpaid product});

  @override
  $PaymentCopyWith<$Res> get payment;
  @override
  $UnpaidCopyWith<$Res> get product;
}

/// @nodoc
class __$$CustomerElementImplCopyWithImpl<$Res>
    extends _$CustomerElementCopyWithImpl<$Res, _$CustomerElementImpl>
    implements _$$CustomerElementImplCopyWith<$Res> {
  __$$CustomerElementImplCopyWithImpl(
      _$CustomerElementImpl _value, $Res Function(_$CustomerElementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? payment = null,
    Object? customerDate = freezed,
    Object? sellerDate = freezed,
    Object? product = null,
  }) {
    return _then(_$CustomerElementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment,
      customerDate: freezed == customerDate
          ? _value.customerDate
          : customerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sellerDate: freezed == sellerDate
          ? _value.sellerDate
          : sellerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Unpaid,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerElementImpl implements _CustomerElement {
  const _$CustomerElementImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.payment,
      @JsonKey(name: 'customer_date') this.customerDate,
      @JsonKey(name: 'seller_date') this.sellerDate,
      required this.product});

  factory _$CustomerElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerElementImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final Payment payment;
  @override
  @JsonKey(name: 'customer_date')
  final DateTime? customerDate;
  @override
  @JsonKey(name: 'seller_date')
  final DateTime? sellerDate;
  @override
  final Unpaid product;

  @override
  String toString() {
    return 'CustomerElement(id: $id, payment: $payment, customerDate: $customerDate, sellerDate: $sellerDate, product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.customerDate, customerDate) ||
                other.customerDate == customerDate) &&
            (identical(other.sellerDate, sellerDate) ||
                other.sellerDate == sellerDate) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, payment, customerDate, sellerDate, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerElementImplCopyWith<_$CustomerElementImpl> get copyWith =>
      __$$CustomerElementImplCopyWithImpl<_$CustomerElementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerElementImplToJson(
      this,
    );
  }
}

abstract class _CustomerElement implements CustomerElement {
  const factory _CustomerElement(
      {@JsonKey(name: '_id') required final String id,
      required final Payment payment,
      @JsonKey(name: 'customer_date') final DateTime? customerDate,
      @JsonKey(name: 'seller_date') final DateTime? sellerDate,
      required final Unpaid product}) = _$CustomerElementImpl;

  factory _CustomerElement.fromJson(Map<String, dynamic> json) =
      _$CustomerElementImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  Payment get payment;
  @override
  @JsonKey(name: 'customer_date')
  DateTime? get customerDate;
  @override
  @JsonKey(name: 'seller_date')
  DateTime? get sellerDate;
  @override
  Unpaid get product;
  @override
  @JsonKey(ignore: true)
  _$$CustomerElementImplCopyWith<_$CustomerElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

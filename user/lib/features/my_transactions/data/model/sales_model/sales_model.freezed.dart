// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalesModel _$SalesModelFromJson(Map<String, dynamic> json) {
  return _SalesModel.fromJson(json);
}

/// @nodoc
mixin _$SalesModel {
  List<CustomerElement> get wait => throw _privateConstructorUsedError;
  List<CustomerElement> get seller => throw _privateConstructorUsedError;
  List<CustomerElement> get customer => throw _privateConstructorUsedError;
  List<Unpaid> get unpaid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesModelCopyWith<SalesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesModelCopyWith<$Res> {
  factory $SalesModelCopyWith(
          SalesModel value, $Res Function(SalesModel) then) =
      _$SalesModelCopyWithImpl<$Res, SalesModel>;
  @useResult
  $Res call(
      {List<CustomerElement> wait,
      List<CustomerElement> seller,
      List<CustomerElement> customer,
      List<Unpaid> unpaid});
}

/// @nodoc
class _$SalesModelCopyWithImpl<$Res, $Val extends SalesModel>
    implements $SalesModelCopyWith<$Res> {
  _$SalesModelCopyWithImpl(this._value, this._then);

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
    Object? unpaid = null,
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
      unpaid: null == unpaid
          ? _value.unpaid
          : unpaid // ignore: cast_nullable_to_non_nullable
              as List<Unpaid>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesModelImplCopyWith<$Res>
    implements $SalesModelCopyWith<$Res> {
  factory _$$SalesModelImplCopyWith(
          _$SalesModelImpl value, $Res Function(_$SalesModelImpl) then) =
      __$$SalesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CustomerElement> wait,
      List<CustomerElement> seller,
      List<CustomerElement> customer,
      List<Unpaid> unpaid});
}

/// @nodoc
class __$$SalesModelImplCopyWithImpl<$Res>
    extends _$SalesModelCopyWithImpl<$Res, _$SalesModelImpl>
    implements _$$SalesModelImplCopyWith<$Res> {
  __$$SalesModelImplCopyWithImpl(
      _$SalesModelImpl _value, $Res Function(_$SalesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wait = null,
    Object? seller = null,
    Object? customer = null,
    Object? unpaid = null,
  }) {
    return _then(_$SalesModelImpl(
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
      unpaid: null == unpaid
          ? _value._unpaid
          : unpaid // ignore: cast_nullable_to_non_nullable
              as List<Unpaid>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesModelImpl implements _SalesModel {
  const _$SalesModelImpl(
      {required final List<CustomerElement> wait,
      required final List<CustomerElement> seller,
      required final List<CustomerElement> customer,
      required final List<Unpaid> unpaid})
      : _wait = wait,
        _seller = seller,
        _customer = customer,
        _unpaid = unpaid;

  factory _$SalesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesModelImplFromJson(json);

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

  final List<Unpaid> _unpaid;
  @override
  List<Unpaid> get unpaid {
    if (_unpaid is EqualUnmodifiableListView) return _unpaid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unpaid);
  }

  @override
  String toString() {
    return 'SalesModel(wait: $wait, seller: $seller, customer: $customer, unpaid: $unpaid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesModelImpl &&
            const DeepCollectionEquality().equals(other._wait, _wait) &&
            const DeepCollectionEquality().equals(other._seller, _seller) &&
            const DeepCollectionEquality().equals(other._customer, _customer) &&
            const DeepCollectionEquality().equals(other._unpaid, _unpaid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wait),
      const DeepCollectionEquality().hash(_seller),
      const DeepCollectionEquality().hash(_customer),
      const DeepCollectionEquality().hash(_unpaid));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesModelImplCopyWith<_$SalesModelImpl> get copyWith =>
      __$$SalesModelImplCopyWithImpl<_$SalesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesModelImplToJson(
      this,
    );
  }
}

abstract class _SalesModel implements SalesModel {
  const factory _SalesModel(
      {required final List<CustomerElement> wait,
      required final List<CustomerElement> seller,
      required final List<CustomerElement> customer,
      required final List<Unpaid> unpaid}) = _$SalesModelImpl;

  factory _SalesModel.fromJson(Map<String, dynamic> json) =
      _$SalesModelImpl.fromJson;

  @override
  List<CustomerElement> get wait;
  @override
  List<CustomerElement> get seller;
  @override
  List<CustomerElement> get customer;
  @override
  List<Unpaid> get unpaid;
  @override
  @JsonKey(ignore: true)
  _$$SalesModelImplCopyWith<_$SalesModelImpl> get copyWith =>
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
  DateTime get createdAt => throw _privateConstructorUsedError;
  Customer get customer => throw _privateConstructorUsedError;
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
      DateTime createdAt,
      Customer customer,
      Unpaid product});

  $PaymentCopyWith<$Res> get payment;
  $CustomerCopyWith<$Res> get customer;
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
    Object? createdAt = null,
    Object? customer = null,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
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
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
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
      DateTime createdAt,
      Customer customer,
      Unpaid product});

  @override
  $PaymentCopyWith<$Res> get payment;
  @override
  $CustomerCopyWith<$Res> get customer;
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
    Object? createdAt = null,
    Object? customer = null,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
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
      required this.createdAt,
      required this.customer,
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
  final DateTime createdAt;
  @override
  final Customer customer;
  @override
  final Unpaid product;

  @override
  String toString() {
    return 'CustomerElement(id: $id, payment: $payment, customerDate: $customerDate, sellerDate: $sellerDate, createdAt: $createdAt, customer: $customer, product: $product)';
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
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, payment, customerDate,
      sellerDate, createdAt, customer, product);

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
      required final DateTime createdAt,
      required final Customer customer,
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
  DateTime get createdAt;
  @override
  Customer get customer;
  @override
  Unpaid get product;
  @override
  @JsonKey(ignore: true)
  _$$CustomerElementImplCopyWith<_$CustomerElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String name, String photo});
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
          _$CustomerImpl value, $Res Function(_$CustomerImpl) then) =
      __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String name, String photo});
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
      _$CustomerImpl _value, $Res Function(_$CustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photo = null,
  }) {
    return _then(_$CustomerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl implements _Customer {
  const _$CustomerImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.photo});

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String photo;

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(
      this,
    );
  }
}

abstract class _Customer implements Customer {
  const factory _Customer(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String photo}) = _$CustomerImpl;

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_discount')
  bool get isDiscount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_after')
  int get priceAfter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'is_discount') bool isDiscount,
      DateTime createdAt,
      @JsonKey(name: 'price_after') int priceAfter});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isDiscount = null,
    Object? createdAt = null,
    Object? priceAfter = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isDiscount: null == isDiscount
          ? _value.isDiscount
          : isDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priceAfter: null == priceAfter
          ? _value.priceAfter
          : priceAfter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentImplCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
          _$PaymentImpl value, $Res Function(_$PaymentImpl) then) =
      __$$PaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'is_discount') bool isDiscount,
      DateTime createdAt,
      @JsonKey(name: 'price_after') int priceAfter});
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
      _$PaymentImpl _value, $Res Function(_$PaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isDiscount = null,
    Object? createdAt = null,
    Object? priceAfter = null,
  }) {
    return _then(_$PaymentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isDiscount: null == isDiscount
          ? _value.isDiscount
          : isDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priceAfter: null == priceAfter
          ? _value.priceAfter
          : priceAfter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentImpl implements _Payment {
  const _$PaymentImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'is_discount') required this.isDiscount,
      required this.createdAt,
      @JsonKey(name: 'price_after') required this.priceAfter});

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'is_discount')
  final bool isDiscount;
  @override
  final DateTime createdAt;
  @override
  @JsonKey(name: 'price_after')
  final int priceAfter;

  @override
  String toString() {
    return 'Payment(id: $id, isDiscount: $isDiscount, createdAt: $createdAt, priceAfter: $priceAfter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isDiscount, isDiscount) ||
                other.isDiscount == isDiscount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.priceAfter, priceAfter) ||
                other.priceAfter == priceAfter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, isDiscount, createdAt, priceAfter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      __$$PaymentImplCopyWithImpl<_$PaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentImplToJson(
      this,
    );
  }
}

abstract class _Payment implements Payment {
  const factory _Payment(
          {@JsonKey(name: '_id') required final String id,
          @JsonKey(name: 'is_discount') required final bool isDiscount,
          required final DateTime createdAt,
          @JsonKey(name: 'price_after') required final int priceAfter}) =
      _$PaymentImpl;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'is_discount')
  bool get isDiscount;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(name: 'price_after')
  int get priceAfter;
  @override
  @JsonKey(ignore: true)
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Unpaid _$UnpaidFromJson(Map<String, dynamic> json) {
  return _Unpaid.fromJson(json);
}

/// @nodoc
mixin _$Unpaid {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get store => throw _privateConstructorUsedError;
  List<Coupons>? get coupons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnpaidCopyWith<Unpaid> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnpaidCopyWith<$Res> {
  factory $UnpaidCopyWith(Unpaid value, $Res Function(Unpaid) then) =
      _$UnpaidCopyWithImpl<$Res, Unpaid>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String title,
      List<String> photos,
      int price,
      String category,
      String store,
      List<Coupons>? coupons});
}

/// @nodoc
class _$UnpaidCopyWithImpl<$Res, $Val extends Unpaid>
    implements $UnpaidCopyWith<$Res> {
  _$UnpaidCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? photos = null,
    Object? price = null,
    Object? category = null,
    Object? store = null,
    Object? coupons = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as String,
      coupons: freezed == coupons
          ? _value.coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as List<Coupons>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnpaidImplCopyWith<$Res> implements $UnpaidCopyWith<$Res> {
  factory _$$UnpaidImplCopyWith(
          _$UnpaidImpl value, $Res Function(_$UnpaidImpl) then) =
      __$$UnpaidImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String title,
      List<String> photos,
      int price,
      String category,
      String store,
      List<Coupons>? coupons});
}

/// @nodoc
class __$$UnpaidImplCopyWithImpl<$Res>
    extends _$UnpaidCopyWithImpl<$Res, _$UnpaidImpl>
    implements _$$UnpaidImplCopyWith<$Res> {
  __$$UnpaidImplCopyWithImpl(
      _$UnpaidImpl _value, $Res Function(_$UnpaidImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? photos = null,
    Object? price = null,
    Object? category = null,
    Object? store = null,
    Object? coupons = freezed,
  }) {
    return _then(_$UnpaidImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as String,
      coupons: freezed == coupons
          ? _value._coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as List<Coupons>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnpaidImpl implements _Unpaid {
  const _$UnpaidImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.title,
      required final List<String> photos,
      required this.price,
      required this.category,
      required this.store,
      final List<Coupons>? coupons})
      : _photos = photos,
        _coupons = coupons;

  factory _$UnpaidImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnpaidImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;
  final List<String> _photos;
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  final int price;
  @override
  final String category;
  @override
  final String store;
  final List<Coupons>? _coupons;
  @override
  List<Coupons>? get coupons {
    final value = _coupons;
    if (value == null) return null;
    if (_coupons is EqualUnmodifiableListView) return _coupons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Unpaid(id: $id, title: $title, photos: $photos, price: $price, category: $category, store: $store, coupons: $coupons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnpaidImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.store, store) || other.store == store) &&
            const DeepCollectionEquality().equals(other._coupons, _coupons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_photos),
      price,
      category,
      store,
      const DeepCollectionEquality().hash(_coupons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnpaidImplCopyWith<_$UnpaidImpl> get copyWith =>
      __$$UnpaidImplCopyWithImpl<_$UnpaidImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnpaidImplToJson(
      this,
    );
  }
}

abstract class _Unpaid implements Unpaid {
  const factory _Unpaid(
      {@JsonKey(name: '_id') required final String id,
      required final String title,
      required final List<String> photos,
      required final int price,
      required final String category,
      required final String store,
      final List<Coupons>? coupons}) = _$UnpaidImpl;

  factory _Unpaid.fromJson(Map<String, dynamic> json) = _$UnpaidImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get title;
  @override
  List<String> get photos;
  @override
  int get price;
  @override
  String get category;
  @override
  String get store;
  @override
  List<Coupons>? get coupons;
  @override
  @JsonKey(ignore: true)
  _$$UnpaidImplCopyWith<_$UnpaidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

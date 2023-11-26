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

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id});
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
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({@JsonKey(name: '_id') String id});
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
  }) {
    return _then(_$PaymentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentImpl implements _Payment {
  const _$PaymentImpl({@JsonKey(name: '_id') required this.id});

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;

  @override
  String toString() {
    return 'Payment(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

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
  const factory _Payment({@JsonKey(name: '_id') required final String id}) =
      _$PaymentImpl;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
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
      int price});
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
      int price});
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
      required this.price})
      : _photos = photos;

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
  String toString() {
    return 'Unpaid(id: $id, title: $title, photos: $photos, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnpaidImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(_photos), price);

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
      required final int price}) = _$UnpaidImpl;

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
  @JsonKey(ignore: true)
  _$$UnpaidImplCopyWith<_$UnpaidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

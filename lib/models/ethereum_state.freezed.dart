// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ethereum_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EthereumState {
  List<String> get accounts => throw _privateConstructorUsedError;
  int? get chainId => throw _privateConstructorUsedError;
  Contract? get contract => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EthereumStateCopyWith<EthereumState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EthereumStateCopyWith<$Res> {
  factory $EthereumStateCopyWith(
          EthereumState value, $Res Function(EthereumState) then) =
      _$EthereumStateCopyWithImpl<$Res, EthereumState>;
  @useResult
  $Res call({List<String> accounts, int? chainId, Contract? contract});
}

/// @nodoc
class _$EthereumStateCopyWithImpl<$Res, $Val extends EthereumState>
    implements $EthereumStateCopyWith<$Res> {
  _$EthereumStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
    Object? chainId = freezed,
    Object? contract = freezed,
  }) {
    return _then(_value.copyWith(
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chainId: freezed == chainId
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as Contract?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EthereumStateCopyWith<$Res>
    implements $EthereumStateCopyWith<$Res> {
  factory _$$_EthereumStateCopyWith(
          _$_EthereumState value, $Res Function(_$_EthereumState) then) =
      __$$_EthereumStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> accounts, int? chainId, Contract? contract});
}

/// @nodoc
class __$$_EthereumStateCopyWithImpl<$Res>
    extends _$EthereumStateCopyWithImpl<$Res, _$_EthereumState>
    implements _$$_EthereumStateCopyWith<$Res> {
  __$$_EthereumStateCopyWithImpl(
      _$_EthereumState _value, $Res Function(_$_EthereumState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
    Object? chainId = freezed,
    Object? contract = freezed,
  }) {
    return _then(_$_EthereumState(
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chainId: freezed == chainId
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as Contract?,
    ));
  }
}

/// @nodoc

class _$_EthereumState extends _EthereumState with DiagnosticableTreeMixin {
  const _$_EthereumState(
      {final List<String> accounts = const [], this.chainId, this.contract})
      : _accounts = accounts,
        super._();

  final List<String> _accounts;
  @override
  @JsonKey()
  List<String> get accounts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  final int? chainId;
  @override
  final Contract? contract;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EthereumState(accounts: $accounts, chainId: $chainId, contract: $contract)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EthereumState'))
      ..add(DiagnosticsProperty('accounts', accounts))
      ..add(DiagnosticsProperty('chainId', chainId))
      ..add(DiagnosticsProperty('contract', contract));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EthereumState &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.chainId, chainId) || other.chainId == chainId) &&
            (identical(other.contract, contract) ||
                other.contract == contract));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_accounts), chainId, contract);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EthereumStateCopyWith<_$_EthereumState> get copyWith =>
      __$$_EthereumStateCopyWithImpl<_$_EthereumState>(this, _$identity);
}

abstract class _EthereumState extends EthereumState {
  const factory _EthereumState(
      {final List<String> accounts,
      final int? chainId,
      final Contract? contract}) = _$_EthereumState;
  const _EthereumState._() : super._();

  @override
  List<String> get accounts;
  @override
  int? get chainId;
  @override
  Contract? get contract;
  @override
  @JsonKey(ignore: true)
  _$$_EthereumStateCopyWith<_$_EthereumState> get copyWith =>
      throw _privateConstructorUsedError;
}

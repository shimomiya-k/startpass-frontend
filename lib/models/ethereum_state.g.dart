// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ethereum_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EthereumState _$$_EthereumStateFromJson(Map<String, dynamic> json) =>
    _$_EthereumState(
      accounts: (json['accounts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      chainId: json['chainId'] as int?,
    );

Map<String, dynamic> _$$_EthereumStateToJson(_$_EthereumState instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
      'chainId': instance.chainId,
    };

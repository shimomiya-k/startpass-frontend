// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ethereum_state.freezed.dart';
part 'ethereum_state.g.dart';

@freezed
class EthereumState with _$EthereumState {
  const EthereumState._();

  const factory EthereumState({
    @Default([]) List<String> accounts,
    int? chainId,
  }) = _EthereumState;

  factory EthereumState.fromJson(Map<String, dynamic> json) => _$EthereumStateFromJson(json);
}

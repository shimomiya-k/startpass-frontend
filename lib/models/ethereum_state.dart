// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ethereum_state.freezed.dart';

@freezed
class EthereumState with _$EthereumState {
  const EthereumState._();

  const factory EthereumState({
    @Default([]) List<String> accounts,
    int? chainId,
    Contract? contract,
  }) = _EthereumState;
}

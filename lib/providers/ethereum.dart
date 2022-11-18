import 'package:flutter_web3/flutter_web3.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/models/ethereum_state.dart';

final ethereumProvider =
    StateNotifierProvider<EthereumProvider, EthereumState>((ref) => EthereumProvider());

class EthereumProvider extends StateNotifier<EthereumState> {
  EthereumProvider() : super(const EthereumState()) {
    getAccounts();
    registerHandler();
  }

  Future<void> getAccounts() async {
    if (ethereum == null) {
      return;
    }

    try {
      final chainId = await ethereum!.getChainId();
      final accounts = await ethereum!.getAccounts();
      state = state.copyWith(accounts: accounts, chainId: chainId);
    } on Exception {
      print('User rejected the modal🥲');
    }
  }

  Future<void> requestAccount() async {
    if (ethereum == null) {
      return;
    }

    try {
      final chainId = await ethereum!.getChainId();
      final accounts = await ethereum!.requestAccount();
      state = state.copyWith(accounts: accounts, chainId: chainId);
    } on EthereumUserRejected {
      print('User rejected the modal🥲');
    }
  }

  registerHandler() {
    if (ethereum == null) {
      return;
    }

    ethereum!.onChainChanged(onChainChanged);
    ethereum!.onAccountsChanged(onAccountsChanged);
  }

  onChainChanged(int chainId) {
    print('chainId');
    print(chainId);
  }

  onAccountsChanged(List<String> accounts) {
    print('accounts');
    print(accounts);
  }
}

import 'package:flutter_web3/flutter_web3.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/models/ethereum_state.dart';

final ethereumProvider =
    StateNotifierProvider<EthereumProvider, EthereumState>((ref) => EthereumProvider());

class EthereumProvider extends StateNotifier<EthereumState> {
  // Goerli chain id
  static const operatingChain = 5;

  EthereumProvider() : super(const EthereumState());

  // 接続しているChainが合っているかどうか
  bool get isInOperatingChain => state.chainId == operatingChain;

  // 接続済みかどうか
  bool get isConnected => Ethereum.isSupported && state.accounts.isNotEmpty;

  // 現在接続されているアカウントを取得しStateを更新する
  Future<bool> getAccounts() async {
    if (ethereum == null) {
      return false;
    }

    if (state.accounts.isNotEmpty) {
      return true;
    }

    try {
      final chainId = await ethereum!.getChainId();
      final accounts = await ethereum!.getAccounts();

      state = state.copyWith(accounts: accounts, chainId: chainId);
      registerHandler();
      return isConnected;
    } on Exception {
      print('User rejected the modal🥲');
      return false;
    }
  }

  // Walletと接続を行う
  Future<void> requestAccount() async {
    if (ethereum == null) {
      return;
    }

    try {
      final chainId = await ethereum!.getChainId();
      final accounts = await ethereum!.requestAccount();
      state = state.copyWith(accounts: accounts, chainId: chainId);
      registerHandler();
    } on EthereumUserRejected {
      print('User rejected the modal🥲');
    }
  }

  // リスナーイベントをハンドリングする
  registerHandler() {
    if (ethereum == null) {
      return;
    }

    ethereum!.onChainChanged(onChainChanged);
    ethereum!.onAccountsChanged(onAccountsChanged);
  }

  onChainChanged(int chainId) {
    state = state.copyWith(chainId: chainId);
  }

  onAccountsChanged(List<String> accounts) {
    state = state.copyWith(accounts: accounts);
  }
}

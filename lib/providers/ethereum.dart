import 'package:flutter_web3/flutter_web3.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/abi.dart';
import 'package:starpass_sample/models/ethereum_state.dart';

final ethereumProvider =
    StateNotifierProvider<EthereumProvider, EthereumState>((ref) => EthereumProvider());

/// Ethereumの状態を管理するProvider
class EthereumProvider extends StateNotifier<EthereumState> {
  // Polygon Testnet chain id
  static const operatingChain = 80001;
  // Read address
  static const contractAddress = '0x7e5B31D0920087d310EF0AB59503d0e8ad2C148d';

  EthereumProvider() : super(const EthereumState());

  // 接続しているChainが合っているかどうか
  bool get isInOperatingChain => state.chainId == operatingChain;

  // 接続済みかどうか
  bool get isConnected => Ethereum.isSupported && state.accounts.isNotEmpty;

  /// 現在接続されているアカウントを取得しStateを更新する
  Future<bool> getAccounts() async {
    // ethereumがnullの場合は何もしない
    if (ethereum == null) {
      return false;
    }

    // 既にaccountsがstateに入っている場合は何もしない
    if (state.accounts.isNotEmpty) {
      return true;
    }

    try {
      final chainId = await ethereum!.getChainId();
      final accounts = await ethereum!.getAccounts();
      state = state.copyWith(accounts: accounts, chainId: chainId);
      registerHandler();
      initContract();
      return isConnected;
    } on Exception {
      print('User rejected the modal🥲');
      return false;
    }
  }

  /// Walletと接続を行う
  Future<void> requestAccount() async {
    if (ethereum == null) {
      return;
    }

    try {
      final chainId = await ethereum!.getChainId();
      final accounts = await ethereum!.requestAccount();
      state = state.copyWith(accounts: accounts, chainId: chainId);
      registerHandler();
      initContract();
    } on EthereumUserRejected {
      print('User rejected the modal🥲');
    }
  }

  /// 必要なChainに誘導する
  Future<void> switchChain() async {
    if (ethereum == null) {
      return;
    }

    try {
      await ethereum!.walletSwitchChain(operatingChain);
    } on EthereumUserRejected {
      print('User rejected the modal🥲');
    }
  }

  /// コントラクトオブジェクトの初期化
  Future<void> initContract() async {
    final web3provider = Web3Provider.fromEthereum(ethereum!);
    final signer = web3provider.getSigner();
    final contract = Contract(contractAddress, Interface(abi), signer);
    state = state.copyWith(contract: contract);
  }

  /// リスナーイベントをハンドリングする
  registerHandler() {
    if (ethereum == null) {
      return;
    }

    ethereum!.onChainChanged(onChainChanged);
    ethereum!.onAccountsChanged(onAccountsChanged);
  }

  /// Chainが変更されたことを検知してStateを更新
  onChainChanged(int chainId) {
    state = state.copyWith(chainId: chainId);
  }

  /// Accountが変更されたことを検知してStateを更新
  /// 未使用
  onAccountsChanged(List<String> accounts) {
    state = state.copyWith(accounts: accounts);
  }
}

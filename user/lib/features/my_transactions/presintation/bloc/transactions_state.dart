part of 'transactions_bloc.dart';

@immutable
class TransactionsState {
  final PageState<SalesModel> allSales;
  final PageState<PurchasesModel> allPurchases;

  const TransactionsState(
      {this.allSales = const PageState.init(),
      this.allPurchases = const PageState.init()});

  TransactionsState copyWith(
      {final PageState<SalesModel>? allSales,
      final PageState<PurchasesModel>? allPurchases}) {
    return TransactionsState(
        allSales: allSales ?? this.allSales,
        allPurchases: allPurchases ?? this.allPurchases);
  }
}

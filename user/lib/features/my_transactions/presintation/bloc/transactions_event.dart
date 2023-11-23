part of 'transactions_bloc.dart';

@immutable
class TransactionsEvent {}

class GetAllSalesEvent extends TransactionsEvent {}

class GetAllPurchasesEvent extends TransactionsEvent {}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:user/core/common/model/page_state/page_state.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/my_transactions/data/model/purchases_model/purchases_model.dart';

import '../../data/model/sales_model/sales_model.dart';
import '../../domain/usecases/get_purchases_use_case.dart';
import '../../domain/usecases/get_sales_use_case.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

@LazySingleton()
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final GetMySalesUseCase getMySalesUseCase;
  final GetMyPurchasesUseCase getMyPurchasesUseCase;
  TransactionsBloc(this.getMySalesUseCase, this.getMyPurchasesUseCase)
      : super(const TransactionsState()) {
    on<GetAllSalesEvent>(_onGetMySalesEvent);
    on<GetAllPurchasesEvent>(_onGetMyPurchasesEvent);
  }

  FutureOr<void> _onGetMySalesEvent(
      GetAllSalesEvent event, Emitter<TransactionsState> emit) async {
    emit(state.copyWith(allSales: const PageState.loading()));
    final result = await getMySalesUseCase(NoParams());
    result.fold((exception, message) {
      emit(state.copyWith(allSales: PageState.error(exception: exception)));
    }, (value) {
      if (value.data.wait.isEmpty &&
          value.data.seller.isEmpty &&
          value.data.customer.isEmpty) {
        emit(state.copyWith(allSales: const PageState.empty()));
      } else {
        emit(state.copyWith(allSales: PageState.loaded(data: value.data)));
      }
    });
  }

  FutureOr<void> _onGetMyPurchasesEvent(
      GetAllPurchasesEvent event, Emitter<TransactionsState> emit) async {
    emit(state.copyWith(allPurchases: const PageState.loading()));
    final result = await getMyPurchasesUseCase(NoParams());
    result.fold((exception, message) {
      emit(state.copyWith(allPurchases: PageState.error(exception: exception)));
    }, (value) {
      if (value.data.wait.isEmpty &&
          value.data.seller.isEmpty &&
          value.data.customer.isEmpty) {
        emit(state.copyWith(allPurchases: const PageState.empty()));
      } else {
        emit(state.copyWith(allPurchases: PageState.loaded(data: value.data)));
      }
    });
  }
}

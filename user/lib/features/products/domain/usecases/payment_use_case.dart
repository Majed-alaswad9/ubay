import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class AddPaymentUseCase extends UseCase<Result<bool>, PaymentParams> {
  final HomeRepository homeRepository;

  AddPaymentUseCase(this.homeRepository);
  @override
  Future<Result<bool>> call(PaymentParams params) async {
    return homeRepository.addPayment(params);
  }
}

class PaymentParams {
  final String product;

  PaymentParams(this.product);
  Map<String, String> get map =>
      {"product": product, "note": "لقد تم دفع الحساب كاملا"};
}

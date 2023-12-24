import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class AddProductUseCase
    extends UseCase<Result<ResponseWrapper<bool>>, AddProductParams> {
  final HomeRepository homeRepository;

  AddProductUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<bool>>> call(AddProductParams params) async {
    return homeRepository.addProduct(params, params.photos);
  }
}

class AddProductParams {
  final String title;
  final String content;
  final int price;
  final String idStore;
  final String idCategory;
  final List<File> photos;

  AddProductParams(this.title, this.content, this.price, this.idStore,
      this.idCategory, this.photos);

  Map<String, dynamic> get map {
    return {
      'title': title,
      'content': content,
      'price': price,
      'category': idCategory,
      'store': idStore,
    };
  }
}

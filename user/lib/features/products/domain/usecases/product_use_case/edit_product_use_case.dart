import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class EditProductUseCase
    extends UseCase<Result<ResponseWrapper<bool>>, EditProductParams> {
  final HomeRepository homeRepository;

  EditProductUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<bool>>> call(EditProductParams params) async {
    return homeRepository.editProduct(params);
  }
}

class EditProductParams {
  final String title;
  final String content;
  final int price;
  final String idStore;
  final String idCategory;
  final List<File> photos;
  final String id;

  EditProductParams(
      {required this.title,
      required this.content,
      required this.price,
      required this.idStore,
      required this.idCategory,
      required this.photos,
      required this.id});

  Map<String, dynamic> get map {
    return {
      'id': id,
      'title': title,
      'content': content,
      'price': price,
      'category': idCategory,
      'store': idStore,
    };
  }
}

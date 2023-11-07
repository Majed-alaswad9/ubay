import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/posts/domain/repository/home_repository.dart';

@injectable
class AddPostUseCase
    extends UseCase<Result<ResponseWrapper<bool>>, AddPostParams> {
  final HomeRepository homeRepository;

  AddPostUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<bool>>> call(AddPostParams params) async {
    return homeRepository.addPost(params, params.photos);
  }
}

class AddPostParams {
  final String title;
  final String content;
  final int price;
  final String idStore;
  final String idCategory;
  final List<File> photos;

  AddPostParams(this.title, this.content, this.price, this.idStore,
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

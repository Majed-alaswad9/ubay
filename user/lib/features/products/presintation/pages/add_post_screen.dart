import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_elevated_button.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/products/data/model/category_model/category_model.dart';
import 'package:user/features/products/data/model/city_model/city_model.dart';
import 'package:user/features/products/data/model/products_model.dart';
import 'package:user/features/products/presintation/widget/drop_down_category.dart';
import 'package:user/features/products/presintation/widget/drop_down_store.dart';

import '../../../../core/common/model/page_state/bloc_status.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../bloc/home_bloc.dart';

class AddPostScreenParams {
  final bool isUpdate;
  final Product? postsModel;

  AddPostScreenParams({required this.isUpdate, this.postsModel});
}

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key, required this.params});
  final AddPostScreenParams params;
  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController contentController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  late String storeId;
  late String categoryId;
  late int price;

  @override
  void initState() {
    if (widget.params.isUpdate) {
      titleController.text = widget.params.postsModel!.title;
      contentController.text = widget.params.postsModel!.content;
      priceController.text = widget.params.postsModel!.price.toString();
      price = widget.params.postsModel!.price;
      storeId = widget.params.postsModel!.store!.id;
      categoryId = widget.params.postsModel!.category!.id;
      storeName = widget.params.postsModel!.store!.name;
      categoryName = widget.params.postsModel!.category!.name;
      photos = widget.params.postsModel!.photos;
    }
    context.read<HomeBloc>().add(GetStoreEvent());
    context.read<HomeBloc>().add(GetCategoryEvent());
    super.initState();
  }

  Datum? dropdownValueStore;
  DataCategory? dropdownValueCategory;
  String? storeName;
  String? categoryName;
  List<String>? photos;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        resizeToAvoidBottomInset: false,
        appBar: UBayAppBar(
          appBarParams: AppBarParams(
            title: LocaleKeys.add_post_screen_new_post.tr(),
            tittleStyle: context.textTheme.titleMedium!.withColor(Colors.white),
            centerTitle: true,
          ),
          isLeading: true,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) => previous.photos != current.photos,
          builder: (context, state) {
            return ListView(
              shrinkWrap: true,
              padding: HWEdgeInsets.all(10),
              children: [
                30.verticalSpace,
                Center(
                  child: AppTextView(
                      '${LocaleKeys.add_post_screen_add.tr()} ${LocaleKeys.add_post_screen_new_post.tr()}',
                      style: context.textTheme.titleLarge!
                          .copyWith(color: context.colorScheme.primary)),
                ),
                50.verticalSpace,
                FormBuilder(
                    key: _formkey,
                    child: Column(
                      children: [
                        AppTextField(
                          textInputType: TextInputType.text,
                          name: 'title',
                          controller: titleController,
                          hintText: LocaleKeys.add_post_screen_title.tr(),
                          maxLines: 1,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: LocaleKeys
                                    .validation_this_field_is_required
                                    .tr()),
                          ]),
                        ),
                        16.verticalSpace,
                        AppTextField(
                          textInputType: TextInputType.multiline,
                          name: 'content',
                          controller: contentController,
                          hintText: LocaleKeys.add_post_screen_content.tr(),
                          maxLines: 5,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: LocaleKeys
                                    .validation_this_field_is_required
                                    .tr()),
                          ]),
                        ),
                        16.verticalSpace,
                        AppTextField(
                          textInputType: TextInputType.number,
                          controller: priceController,
                          name: 'price',
                          onChange: (val) {
                            price = int.parse(val.toString());
                          },
                          hintText: LocaleKeys.add_post_screen_price.tr(),
                          maxLines: 1,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: LocaleKeys
                                    .validation_this_field_is_required
                                    .tr()),
                          ]),
                        ),
                        16.verticalSpace,
                        DropDownStore(
                          widget: (data) {
                            return DropdownButtonFormField<Datum>(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  return storeId ??
                                      LocaleKeys
                                          .validation_this_field_is_required
                                          .tr();
                                },
                                borderRadius: BorderRadius.circular(16),
                                hint: Text(
                                  widget.params.isUpdate
                                      ? widget.params.postsModel!.store!.name
                                      : LocaleKeys.add_post_screen_store.tr(),
                                  style: context.textTheme.bodyMedium?.s13!
                                      .copyWith(
                                          color: widget.params.isUpdate
                                              ? Colors.black
                                              : context.colorScheme.primary),
                                ),
                                isExpanded: true,
                                value: dropdownValueStore,
                                style: context.textTheme.titleSmall!
                                    .copyWith(color: Colors.white),
                                items: data.data.map((e) {
                                  return DropdownMenuItem<Datum>(
                                      value: e,
                                      child: Text(
                                        '${e.name}-${e.city.name}',
                                        style: context.textTheme.titleSmall,
                                      ));
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    dropdownValueStore = value;
                                    storeId = value!.id;
                                  });
                                });
                          },
                        ),
                        16.verticalSpace,
                        DropDownCategory(
                            widget: (data) => DropdownButtonFormField<
                                    DataCategory>(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                validator: (value) =>
                                    categoryId ??
                                    LocaleKeys.validation_this_field_is_required
                                        .tr(),
                                borderRadius: BorderRadius.circular(16),
                                hint: Text(
                                  widget.params.isUpdate
                                      ? widget.params.postsModel!.category!.name
                                      : LocaleKeys.add_post_screen_category
                                          .tr(),
                                  style: context.textTheme.bodyMedium?.s13!
                                      .copyWith(
                                          color: widget.params.isUpdate
                                              ? Colors.black
                                              : context.colorScheme.primary),
                                ),
                                isExpanded: true,
                                value: dropdownValueCategory,
                                style: context.textTheme.titleSmall,
                                items: data.data
                                    .map((e) => DropdownMenuItem<DataCategory>(
                                        value: e, child: Text(e.name)))
                                    .toList(),
                                onChanged: (value) {
                                  dropdownValueCategory = value;
                                  categoryId = value!.id;
                                }))
                      ],
                    )),
                16.verticalSpace,
                AppTextField(
                  name: 'photos',
                  readOnly: true,
                  hintText: 'photos',
                  onTap: () {
                    context.read<HomeBloc>().add(PickImagesEvent());
                  },
                  suffixIcon: Icon(
                    Icons.file_upload,
                    color: context.colorScheme.primary,
                  ),
                ),
                10.verticalSpace,
                if (state.photos != null)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.params.isUpdate
                        ? photos!.length
                        : state.photos!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2 / 3
                            // Horizontally only 3 images will show
                            ),
                    itemBuilder: (BuildContext context, int index) {
                      return Expanded(
                          child: Center(
                              child: widget.params.isUpdate
                                  ? Image.network(photos![index])
                                  : Image.file(state.photos![index])));
                    },
                  ),
                20.verticalSpace,
                BlocSelector<HomeBloc, HomeState, BlocStatus>(
                  selector: (state) => widget.params.isUpdate
                      ? state.editProduct
                      : state.addProduct,
                  builder: (context, state) {
                    return AppElevatedButton(
                      isLoading: state.isLoading(),
                      onPressed: () {
                        _formkey.currentState!.validate();
                        _formkey.currentState!.save();
                        if (_formkey.currentState!.isValid &&
                            categoryId.isNotEmpty &&
                            storeId.isNotEmpty) {
                          if (widget.params.isUpdate) {
                            context.read<HomeBloc>().add(EditProductEvent(
                                widget.params.postsModel!.id,
                                titleController.text,
                                contentController.text,
                                price,
                                storeId,
                                categoryId,
                                context));
                          } else {
                            context.read<HomeBloc>().add(AddProductEvent(
                                titleController.text,
                                contentController.text,
                                price,
                                storeId,
                                categoryId));
                          }
                        }
                      },
                      child: AppTextView(
                        widget.params.isUpdate
                            ? LocaleKeys.edit.tr()
                            : LocaleKeys.add.tr(),
                        style: context.textTheme.bodyLarge!
                            .copyWith(color: Colors.white),
                      ),
                    );
                  },
                )
              ],
            );
          },
        ));
  }
}

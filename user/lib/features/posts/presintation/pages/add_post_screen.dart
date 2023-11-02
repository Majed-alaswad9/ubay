import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:user/core/common/model/page_state/page_state.dart';
import 'package:user/core/common/model/page_state/result_builder.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_elevated_button.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/loading_indicator.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/posts/data/model/category_model/category_model.dart';
import 'package:user/features/posts/data/model/city_model/city_model.dart';

import '../../../../core/common/model/page_state/bloc_status.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../bloc/home_bloc.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController contentController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController storeController = TextEditingController();

  final TextEditingController categoryController = TextEditingController();

  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  late String storeId;
  late String categoryId;

  @override
  void initState() {
    context.read<HomeBloc>().add(GetStoreEvent());
    context.read<HomeBloc>().add(GetCategoryEvent());
    super.initState();
  }

  Datum? dropdownValueStore;
  Data? dropdownValueCategory;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        resizeToAvoidBottomInset: false,
        appBar: UBayAppBar(
          appBarParams: AppBarParams(
            title: LocaleKeys.add_post_screen_new_post.tr(),
            tittleStyle: const TextStyle(fontSize: 20, color: Colors.white),
            centerTitle: true,
          ),
          isLeading: true,
        ),
        body: ListView(
          padding: HWEdgeInsets.all(10),
          children: [
            30.verticalSpace,
            AppTextView(
                '${LocaleKeys.add_post_screen_add.tr()} ${LocaleKeys.add_post_screen_new_post.tr()}',
                style: context.textTheme.titleLarge!
                    .copyWith(color: context.colorScheme.primary)),
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
                      textInputType: TextInputType.text,
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
                      name: 'price',
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
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return PageStateBuilder<StoreModel>(
                          init: AppTextField(
                            readOnly: true,
                            name: 'store',
                            hintText: LocaleKeys.add_post_screen_store.tr(),
                            suffixIcon: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: context.colorScheme.primary,
                            ),
                          ),
                          success: (data) {
                            return DropdownButtonFormField<Datum>(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                validator: (value) => value == null
                                    ? LocaleKeys
                                        .validation_this_field_is_required
                                    : null,
                                borderRadius: BorderRadius.circular(16),
                                hint: Text(
                                  LocaleKeys.add_post_screen_store.tr(),
                                  style: context.textTheme.bodyMedium?.s13!
                                      .copyWith(color: Colors.white),
                                ),
                                isExpanded: true,
                                value: dropdownValueStore,
                                style: context.textTheme.titleSmall!
                                    .copyWith(color: Colors.white),
                                items: data.data.map((e) {
                                  return DropdownMenuItem<Datum>(
                                      value: e,
                                      child: Text('${e.name}-${e.city.name}'));
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    dropdownValueStore = value;
                                    storeId = value!.id;
                                  });
                                });
                          },
                          loading: AppTextField(
                            name: 'store',
                            hintText: LocaleKeys.add_post_screen_store.tr(),
                            suffixIcon: LoadingIndicator(
                              color: context.colorScheme.primary,
                            ),
                          ),
                          error: (Exception? error) {
                            return InkWell(
                              onTap: () {
                                context.read<HomeBloc>().add(GetStoreEvent());
                              },
                              child: AppTextField(
                                name: 'store',
                                hintText: LocaleKeys.add_post_screen_store.tr(),
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            );
                          },
                          result: state.storeStatus,
                          empty: Text('no store'),
                        );
                      },
                    ),
                    16.verticalSpace,
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return PageStateBuilder<CategoryModel>(
                          init: AppTextField(
                            name: 'category',
                            hintText: LocaleKeys.add_post_screen_category.tr(),
                            suffixIcon: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: context.colorScheme.primary,
                            ),
                          ),
                          success: (data) {
                            return DropdownButtonFormField<Data>(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                validator: (value) => value == null
                                    ? LocaleKeys
                                        .validation_this_field_is_required
                                    : null,
                                borderRadius: BorderRadius.circular(16),
                                hint: Text(
                                  LocaleKeys.add_post_screen_store.tr(),
                                  style: context.textTheme.bodyMedium?.s13,
                                ),
                                isExpanded: true,
                                value: dropdownValueCategory,
                                style: context.textTheme.titleSmall!
                                    .copyWith(color: Colors.white),
                                items: data.data
                                    .map((e) => DropdownMenuItem<Data>(
                                        value: e, child: Text(e.name)))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    dropdownValueCategory = value!;
                                    categoryId = value.id;
                                    print(dropdownValueCategory!.id);
                                    print(value);
                                  });
                                });
                          },
                          loading: AppTextField(
                            name: 'category',
                            hintText: LocaleKeys.add_post_screen_category.tr(),
                            suffixIcon: LoadingIndicator(
                              color: context.colorScheme.primary,
                            ),
                          ),
                          error: (Exception? error) {
                            return InkWell(
                              onTap: () {
                                context.read<HomeBloc>().add(GetStoreEvent());
                              },
                              child: AppTextField(
                                readOnly: true,
                                name: 'category',
                                hintText: LocaleKeys.add_post_screen_store.tr(),
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            );
                          },
                          result: state.categoryStatus,
                          empty: Text('no category'),
                        );
                      },
                    ),
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
              suffixIcon: const Icon(Icons.file_upload),
            ),
            10.verticalSpace,
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) => current.photos != null,
                builder: (context, state) {
                  return SizedBox(
                    width: 300.0,
                    child: GridView.builder(
                      itemCount: state.photos!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                            child: kIsWeb
                                ? Image.network(state.photos![index].path)
                                : Image.file(state.photos![index]));
                      },
                    ),
                  );
                },
              ),
            ),
            20.verticalSpace,
            AppElevatedButton(
              onPressed: () {},
              child: AppTextView(
                'Add',
                style: context.textTheme.bodyMedium,
              ),
            )
          ],
        ));
  }
}

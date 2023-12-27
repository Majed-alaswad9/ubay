import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/config/themes/app_theme.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/setting/presintation/widget/cities_drop_down.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../../../products/data/model/category_model/category_model.dart';
import '../../../products/presintation/widget/drop_down_category.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DataCategory? dropdownValueCategory;
    DataCategory? dropdownValueCities;
    List<DataCategory> listCategoryFav = [];
    List<DataCategory> listCitiesFav = [];
    return AppScaffold(
        appBar: UBayAppBar(
            isLeading: true,
            appBarParams: AppBarParams(
                title: LocaleKeys.settings_post_preferences.tr(),
                tittleStyle:
                    context.textTheme.titleMedium.withColor(Colors.white),
                centerTitle: true)),
        body: Padding(
          padding: HWEdgeInsets.all(kpPaddingPage),
          child: Column(
            children: [
              if (listCitiesFav.isNotEmpty) ...[
                ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: HWEdgeInsets.all(3.5),
                        decoration: BoxDecoration(
                            color: context.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Text(listCitiesFav[index].name),
                            5.horizontalSpace,
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.clear))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, _) => 10.horizontalSpace,
                    itemCount: listCitiesFav.length),
                10.verticalSpace
              ],
              DropDownCities(
                  widget: (data) => DropdownButtonFormField<DataCategory>(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      borderRadius: BorderRadius.circular(16),
                      hint: Text(
                        LocaleKeys.add_post_screen_category.tr(),
                        style: context.textTheme.bodyMedium?.s13!
                            .copyWith(color: context.colorScheme.primary),
                      ),
                      isExpanded: true,
                      value: dropdownValueCities,
                      style: context.textTheme.titleSmall,
                      items: data.data
                          .map((e) => DropdownMenuItem<DataCategory>(
                              value: e, child: Text(e.name)))
                          .toList(),
                      onChanged: (value) {
                        dropdownValueCategory = value;
                        listCitiesFav.add(value!);
                      })),
              12.verticalSpace,
              if (listCitiesFav.isNotEmpty) ...[
                ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: HWEdgeInsets.all(3.5),
                        decoration: BoxDecoration(
                            color: context.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Text(listCategoryFav[index].name),
                            5.horizontalSpace,
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, _) => 10.horizontalSpace,
                    itemCount: listCitiesFav.length),
                10.verticalSpace
              ],
              DropDownCategory(
                  widget: (data) => DropdownButtonFormField<DataCategory>(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      borderRadius: BorderRadius.circular(16),
                      hint: Text(
                        LocaleKeys.add_post_screen_category.tr(),
                        style: context.textTheme.bodyMedium?.s13!
                            .copyWith(color: context.colorScheme.primary),
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
                      })),
              Center(
                child: SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          AppTextView(
                            LocaleKeys.save.tr(),
                            style: context.textTheme.titleSmall
                                .withColor(Colors.white),
                          ),
                          5.horizontalSpace,
                          const Icon(
                            Icons.save,
                            color: Colors.white,
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ));
  }
}

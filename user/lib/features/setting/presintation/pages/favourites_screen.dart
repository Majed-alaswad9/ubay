import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../widget/favourite_item.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
    return AppScaffold(
        appBar: UBayAppBar(
            isLeading: true,
            appBarParams: AppBarParams(
                title: LocaleKeys.settings_post_preferences.tr(),
                tittleStyle:
                    context.textTheme.titleMedium.withColor(Colors.white),
                centerTitle: true)),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: REdgeInsets.only(top: 14),
                itemCount: filterMap.length,
                itemBuilder: (context, index) {
                  final key = filterMap.keys.elementAt(index);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextView(
                          style: context.textTheme.titleSmall,
                          filterMap.keys.elementAt(index)),
                      6.verticalSpace,
                      ...filterMap[key]!.map(
                        (e) => ValueListenableBuilder<int>(
                          valueListenable: _selectedIndex,
                          builder: (context, value, child) => FilterTypeItem(
                            e.title,
                            onTap: () =>
                                _selectedIndex.value = _getOuterIndex(e.title),
                            active: value == _getOuterIndex(e.title),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
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
        ));
  }

  int _getOuterIndex(String itemName) {
    int index = 0;
    for (final key in filterMap.keys) {
      if (filterMap[key]!.any((element) => element.title == itemName)) {
        return filterMap[key]!
                .indexWhere((element) => element.title == itemName) +
            index;
      }
      index += filterMap[key]!.length;
    }
    return index;
  }

  Map<String, List<FilterType>> filterMap = {
    'General Filters': [
      FilterType(
        'Sort By',
      ),
      FilterType(
        'Cuisines',
      ),
      FilterType(
        'Price',
      ),
      FilterType(
        'Rating',
      ),
      FilterType(
        'Delivery time',
      ),
      FilterType(
        'Allergies',
      ),
    ],
    'Advanced Filters': [
      FilterType('Open Now'),
      FilterType('Vegetarian'),
      FilterType('Halal'),
    ],
  };
}

class FilterType {
  final String title;
  const FilterType(this.title);
}

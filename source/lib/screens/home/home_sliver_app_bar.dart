import 'package:felix_flutter/configs/config.dart';
import 'package:felix_flutter/models/model.dart';
import 'package:felix_flutter/screens/home/home_category_item.dart';
import 'package:felix_flutter/screens/home/home_swiper.dart';
import 'package:felix_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class AppBarHomeSliver extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final List<ImageModel> banners;
  final List<CategoryModel> category;
  final Function(CategoryModel) onPress;

  AppBarHomeSliver({
    this.expandedHeight,
    this.banners,
    this.category,
    this.onPress,
  });

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: <Widget>[
            Container(
              height: 190,
              child: HomeSwipe(images: banners),
            ),
            Container(),
          ],
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.searchHistory);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 16,
                              bottom: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).hoverColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  Translate.of(context).translate(
                                    'what_are_you_looking_for',
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: _buildCategory(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///Build category UI
  Widget _buildCategory() {
    List<CategoryModel> listBuild = category;
    final more = CategoryModel.fromJson({
      "id": 9,
      "title": "more",
      "icon": "more_horiz",
      "color": "#ff8a65",
      "type": "more"
    });

    if (category == null) {
      return Wrap(
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: List.generate(8, (index) => index).map(
          (item) {
            return HomeCategoryItem();
          },
        ).toList(),
      );
    }

    if (category.length > 7) {
      listBuild = category.take(7).toList();
      listBuild.add(more);
    }

    return Wrap(
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: listBuild.map(
        (item) {
          return HomeCategoryItem(
            item: item,
            onPressed: onPress,
          );
        },
      ).toList(),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

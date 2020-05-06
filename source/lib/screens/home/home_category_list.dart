import 'package:felix_flutter/models/model.dart';
import 'package:felix_flutter/screens/home/home_category_item.dart';
import 'package:flutter/material.dart';

class HomeCategoryList extends StatelessWidget {
  final List<CategoryModel> category;
  final Function(CategoryModel) onPress;

  HomeCategoryList({
    Key key,
    this.category,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8),
                  width: 40,
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 24),
                  child: Wrap(
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: category.map(
                      (item) {
                        return HomeCategoryItem(
                          item: item,
                          onPressed: onPress,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

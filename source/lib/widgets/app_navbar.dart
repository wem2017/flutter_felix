import 'package:felix_flutter/models/model.dart';
import 'package:felix_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget {
  final SortModel currentSort;
  final VoidCallback onChangeSort;
  final VoidCallback onChangeView;
  final VoidCallback onFilter;
  final IconData iconModeView;

  AppNavBar({
    Key key,
    this.currentSort,
    this.onChangeSort,
    this.iconModeView,
    this.onChangeView,
    this.onFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(currentSort.icon),
                  onPressed: onChangeSort,
                ),
                Text(
                  Translate.of(context).translate(currentSort.name),
                  style: Theme.of(context).textTheme.subtitle,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(iconModeView),
                      onPressed: onChangeView,
                    ),
                    Container(
                      height: 24,
                      child: VerticalDivider(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.track_changes),
                  onPressed: onFilter,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Text(
                    Translate.of(context).translate('filter'),
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

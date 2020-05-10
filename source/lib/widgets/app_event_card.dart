import 'package:felix_flutter/configs/config.dart';
import 'package:felix_flutter/models/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class AppEventCard extends StatelessWidget {
  AppEventCard({
    Key key,
    this.item,
    this.onPressed,
  }) : super(key: key);

  final EventModel item;
  final Function(EventModel) onPressed;

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        enabled: true,
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        onPressed(item);
      },
      child: Container(
        width: 200,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(item.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            DateFormat(
                              'MMM',
                              AppLanguage.defaultLanguage.languageCode,
                            ).format(item.startTime),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                          ),
                          Text(
                            DateFormat(
                              'dd',
                              AppLanguage.defaultLanguage.languageCode,
                            ).format(item.startTime),
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text(
                                  item.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                DateFormat(
                                  Application.formatTime,
                                  AppLanguage.defaultLanguage.languageCode,
                                ).format(item.startTime),
                                style: Theme.of(context).textTheme.caption,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                item.address,
                                style: Theme.of(context).textTheme.caption,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

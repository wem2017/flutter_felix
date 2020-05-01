import 'package:felix_flutter/configs/config.dart';
import 'package:felix_flutter/models/model.dart';
import 'package:felix_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class AppBookingHistory extends StatelessWidget {
  final BookingHistoryModel item;
  final Function(BookingHistoryModel) onPressed;

  AppBookingHistory({
    Key key,
    this.item,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Shimmer.fromColors(
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
        ),
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
      );
    }

    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        onPressed(item);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: Theme.of(context).primaryColorLight,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    item.title,
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              border: Border(
                top: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Check In',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      DateFormat(
                        'EEE MMM d yyyy',
                        AppLanguage.defaultLanguage.languageCode,
                      ).format(item.checkIn),
                      style: Theme.of(context).textTheme.body1.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Check Out',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      DateFormat(
                        'EEE MMM d yyyy',
                        AppLanguage.defaultLanguage.languageCode,
                      ).format(item.checkOut),
                      style: Theme.of(context).textTheme.body1.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: Theme.of(context).focusColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Text(
                    '${item.day} ${Translate.of(context).translate('day')} ${item.night} ${Translate.of(context).translate('night')}',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    '${item.price}',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

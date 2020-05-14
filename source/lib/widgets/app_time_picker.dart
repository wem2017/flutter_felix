import 'package:felix_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

enum TimeType { start, end }

class AppTimePicker extends StatelessWidget {
  final TimeOfDay startHour;
  final TimeOfDay endHour;
  final Function(TimeOfDay) onChangeStartHour;
  final Function(TimeOfDay) onChangeEndHour;
  final String labelStart;
  final String labelEnd;

  AppTimePicker({
    Key key,
    this.startHour,
    this.endHour,
    this.onChangeStartHour,
    this.onChangeEndHour,
    this.labelStart,
    this.labelEnd,
  }) : super(key: key);

  ///Show Picker Time
  Future<void> _showTimePicker(BuildContext context, TimeType type) async {
    final picked = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
    if (type == TimeType.start && picked != null) {
      onChangeStartHour(picked);
    }
    if (type == TimeType.end && picked != null) {
      onChangeEndHour(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  _showTimePicker(context, TimeType.start);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      labelStart ??
                          Translate.of(context).translate(
                            'start_time',
                          ),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${startHour.hour > 9 ? startHour.hour : '0' + startHour.hour.toString()}:${startHour.minute > 9 ? startHour.minute : '0' + startHour.minute.toString()}",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
            VerticalDivider(
              color: Theme.of(context).disabledColor,
            ),
            Expanded(
              child: Container(
                child: InkWell(
                  onTap: () {
                    _showTimePicker(context, TimeType.end);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        labelEnd ??
                            Translate.of(context).translate(
                              'end_time',
                            ),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${endHour.hour > 9 ? endHour.hour : '0' + endHour.hour.toString()}:${endHour.minute > 9 ? endHour.minute : '0' + endHour.minute.toString()}",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
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

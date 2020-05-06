import 'package:felix_flutter/configs/config.dart';
import 'package:felix_flutter/models/model.dart';
import 'package:felix_flutter/utils/utils.dart';
import 'package:felix_flutter/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum HotelViewType { list, block, gird }

class AppHotelItem extends StatelessWidget {
  AppHotelItem({
    Key key,
    this.item,
    this.onPressed,
    this.type,
  }) : super(key: key);

  final HotelModel item;
  final HotelViewType type;
  final Function(HotelModel) onPressed;

  @override
  Widget build(BuildContext context) {
    switch (type) {

      ///Mode View Gird
      case HotelViewType.gird:
        if (item == null) {
          return Shimmer.fromColors(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Container(
                      color: Colors.white,
                      height: 10,
                      width: 50,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Container(
                      color: Colors.white,
                      height: 12,
                      width: 80,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Container(
                      color: Colors.white,
                      height: 12,
                      width: 120,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Container(
                      color: Colors.white,
                      height: 18,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
          );
        }

        return FlatButton(
          onPressed: () {
            onPressed(item);
          },
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        item.status.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.all(6),
                                child: AppTag(
                                  Translate.of(context).translate(item.status),
                                  type: TagType.status,
                                ),
                              )
                            : Container()
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            item.favorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: item.favorite
                                ? Theme.of(context).primaryColorLight
                                : Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 12,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        child: Text(
                          item.address,
                          style: Theme.of(context).textTheme.caption,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  item.title,
                  style: Theme.of(context)
                      .textTheme
                      .body2
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    StarRating(
                      rating: item.rate,
                      size: 14,
                      color: AppTheme.yellowColor,
                      borderColor: AppTheme.yellowColor,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${item.numRate} ${Translate.of(context).translate('review')}',
                              style: Theme.of(context).textTheme.caption,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      item.price,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 4, right: 4),
                        child: Text(
                          Translate.of(context).translate(item.kind),
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );

      ///Mode View List
      case HotelViewType.list:
        if (item == null) {
          return Shimmer.fromColors(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 4,
                      bottom: 4,
                      left: 8,
                      right: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 14,
                          width: 100,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Container(
                            height: 14,
                            width: 140,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Container(
                            height: 14,
                            width: 150,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Container(
                            height: 12,
                            width: 160,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Container(
                            height: 20,
                            width: 60,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Container(
                            height: 12,
                            width: 160,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
          );
        }

        return FlatButton(
          onPressed: () {
            onPressed(item);
          },
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    item.status.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.all(6),
                            child: AppTag(
                              Translate.of(context).translate(item.status),
                              type: TagType.status,
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.title,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              size: 12,
                              color: Theme.of(context).primaryColor,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 2, right: 2),
                                child: Text(item.address,
                                    maxLines: 1,
                                    style: Theme.of(context).textTheme.caption),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              size: 12,
                              color: Theme.of(context).primaryColor,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 2, right: 2),
                                child: Text(item.phone,
                                    maxLines: 1,
                                    style: Theme.of(context).textTheme.caption),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            AppTag(
                              "${item.rate}",
                              type: TagType.rateSmall,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4, right: 4),
                              child: StarRating(
                                rating: item.rate,
                                size: 14,
                                color: AppTheme.yellowColor,
                                borderColor: AppTheme.yellowColor,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '${item.numRate} ${Translate.of(context).translate('review')}',
                                    style: Theme.of(context).textTheme.caption,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              item.price,
                              style: Theme.of(context).textTheme.title.copyWith(
                                  color: Theme.of(context).primaryColor),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4, right: 4),
                              child: Text(
                                Translate.of(context).translate(item.kind),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            item.highlight ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Theme.of(context).accentColor),
                          ),
                          Icon(
                            item.favorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );

      ///Mode View Block
      case HotelViewType.block:
        if (item == null) {
          return Shimmer.fromColors(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Container(
                        height: 10,
                        width: 200,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
          );
        }

        return FlatButton(
          onPressed: () {
            onPressed(item);
          },
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          item.status.isNotEmpty
                              ? AppTag(
                                  item.status,
                                  type: TagType.status,
                                )
                              : Container(),
                          Icon(
                            item.favorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: item.favorite
                                ? Theme.of(context).primaryColorLight
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  AppTag(
                                    "${item.rate}",
                                    type: TagType.rateSmall,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4, right: 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          Translate.of(context)
                                              .translate(item.rateText),
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        StarRating(
                                          rating: item.rate,
                                          size: 14,
                                          color: AppTheme.yellowColor,
                                          borderColor: AppTheme.yellowColor,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Text(
                                  "${item.numRate} ${Translate.of(context).translate('review')}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.title,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 2, right: 2),
                              child: Text(item.address,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.caption),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            size: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 2, right: 2),
                              child: Text(item.phone,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.caption),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            item.price,
                            style: Theme.of(context).textTheme.title.copyWith(
                                color: Theme.of(context).primaryColor),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4, right: 4),
                            child: Text(
                              Translate.of(context).translate(item.kind),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  item.highlight ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                          color: Theme.of(context).accentColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

      default:
        return Container(width: 160.0);
    }
  }
}

import 'package:felix_flutter/utils/utils.dart';
import 'package:felix_flutter/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum ProductCardType { small, action }

class AppProductCard extends StatelessWidget {
  AppProductCard({
    Key key,
    this.item,
    this.onPressed,
    this.type = ProductCardType.action,
  }) : super(key: key);

  final dynamic item;
  final Function(dynamic) onPressed;
  final ProductCardType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ProductCardType.action:
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
          child: Card(
            elevation: 2,
            margin: EdgeInsets.all(0),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(item.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                    ),
                    Container(
                      height: 24,
                      child: Row(
                        children: <Widget>[
                          AppButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            onPressed: () {},
                            text: Translate.of(context).translate('book_now'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );

      case ProductCardType.small:
        if (item == null) {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
            enabled: true,
            child: Container(
              width: 135,
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
          child: Card(
            elevation: 2,
            margin: EdgeInsets.all(0),
            child: Container(
              width: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(item.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

      default:
        return Container();
    }
  }
}

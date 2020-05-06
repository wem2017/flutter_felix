import 'package:felix_flutter/api/api.dart';
import 'package:felix_flutter/configs/config.dart';
import 'package:felix_flutter/models/model.dart';
import 'package:felix_flutter/models/screen_models/screen_models.dart';
import 'package:felix_flutter/screens/home/home_category_list.dart';
import 'package:felix_flutter/screens/home/home_sliver_app_bar.dart';
import 'package:felix_flutter/utils/utils.dart';
import 'package:felix_flutter/widgets/widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  HomePageModel _homePage;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  ///On select category and More
  void _onPressCategory(CategoryModel item) {
    switch (item.type) {
      case CategoryType.hotel:
        Navigator.pushNamed(context, Routes.hotel);
        break;
      default:
        _onChangeSort();
    }
  }

  ///Fetch API
  Future<void> _loadData() async {
    final ResultApiModel result = await Api.getHome();
    if (result.success) {
      setState(() {
        _homePage = HomePageModel.fromJson(result.data);
      });
    }
  }

  ///On Open More
  void _onChangeSort() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return HomeCategoryList(
          category: _homePage?.category,
        );
      },
    );
  }

  ///On navigate product detail
  void _onProductDetail(item) {}

  ///Build PromotionToday List
  Widget _buildPromotionToday() {
    if (_homePage?.promotion == null) {
      return ListView(
        padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 3),
        scrollDirection: Axis.horizontal,
        children: List.generate(8, (index) => index).map(
          (item) {
            return Padding(
              padding: EdgeInsets.only(left: 15),
              child: AppProductCard(),
            );
          },
        ).toList(),
      );
    }

    return ListView(
      padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 3),
      scrollDirection: Axis.horizontal,
      children: _homePage.promotion.map(
        (item) {
          return Padding(
            padding: EdgeInsets.only(left: 15),
            child: AppProductCard(
              item: item,
              onPressed: _onProductDetail,
            ),
          );
        },
      ).toList(),
    );
  }

  ///Widget build Tour List
  Widget _buildTour() {
    if (_homePage?.tour == null) {
      return ListView(
        padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 3),
        scrollDirection: Axis.horizontal,
        children: List.generate(8, (index) => index).map(
          (item) {
            return Padding(
              padding: EdgeInsets.only(left: 15),
              child: AppProductCard(type: ProductCardType.small),
            );
          },
        ).toList(),
      );
    }

    return ListView(
      padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 3),
      scrollDirection: Axis.horizontal,
      children: _homePage.tour.map(
        (item) {
          return Padding(
            padding: EdgeInsets.only(left: 15),
            child: AppProductCard(
              item: item,
              onPressed: _onProductDetail,
              type: ProductCardType.small,
            ),
          );
        },
      ).toList(),
    );
  }

  ///Widget build Event list
  Widget _buildEvent() {
    if (_homePage?.event == null) {
      return ListView(
        padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 3),
        scrollDirection: Axis.horizontal,
        children: List.generate(8, (index) => index).map(
          (item) {
            return Padding(
              padding: EdgeInsets.only(left: 15),
              child: AppEventCard(),
            );
          },
        ).toList(),
      );
    }

    return ListView(
      padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 3),
      scrollDirection: Axis.horizontal,
      children: _homePage.event.map(
        (item) {
          return Padding(
            padding: EdgeInsets.only(left: 15),
            child: AppEventCard(
              item: item,
              onPressed: _onProductDetail,
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: AppBarHomeSliver(
              expandedHeight: 350,
              banners: _homePage?.banner ?? [],
              category: _homePage?.category,
              onPress: _onPressCategory,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.only(top: 16, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Translate.of(context).translate('promos_today'),
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: EdgeInsets.only(top: 3)),
                    Text(
                      Translate.of(context).translate('slogan_promos_today'),
                      style: Theme.of(context).textTheme.body2,
                    )
                  ],
                ),
              ),
              Container(
                height: 250,
                child: _buildPromotionToday(),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Translate.of(context).translate('tours'),
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    Text(
                      Translate.of(context).translate('slogan_tours'),
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ],
                ),
              ),
              Container(
                height: 160,
                child: _buildTour(),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Translate.of(context).translate('event_coming_title'),
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    Text(
                      Translate.of(context).translate('slogan_event'),
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: _buildEvent(),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

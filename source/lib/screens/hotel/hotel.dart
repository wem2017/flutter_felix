import 'package:felix_flutter/api/api.dart';
import 'package:felix_flutter/configs/config.dart';
import 'package:felix_flutter/models/model.dart';
import 'package:felix_flutter/models/screen_models/screen_models.dart';
import 'package:felix_flutter/utils/utils.dart';
import 'package:felix_flutter/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Hotel extends StatefulWidget {
  Hotel({Key key}) : super(key: key);

  @override
  _HotelState createState() {
    return _HotelState();
  }
}

class _HotelState extends State<Hotel> {
  final _controller = RefreshController(initialRefresh: false);
  SortModel _currentSort = AppSort.defaultSort;
  List<SortModel> _listSort = AppSort.listSortDefault;
  HotelViewType _modeView = HotelViewType.gird;
  HotelPageModel _hotelPageModel;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  ///On Fetch API
  Future<void> _loadData() async {
    final ResultApiModel result = await Api.getHotelList();
    if (result.success) {
      setState(() {
        _hotelPageModel = HotelPageModel.fromJson(result.data);
      });
    }
  }

  ///On Load More
  Future<void> _onLoading() async {
    await Future.delayed(Duration(seconds: 1));
    _controller.loadComplete();
  }

  ///On Refresh List
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    _controller.refreshCompleted();
  }

  ///On search
  void _onSearch() {
    Navigator.pushNamed(context, Routes.searchHistory);
  }

  ///On change filter
  void _onChangeFilter() {
    Navigator.pushNamed(context, Routes.filter);
  }

  ///On Change View
  void _onChangeView() {
    switch (_modeView) {
      case HotelViewType.gird:
        _modeView = HotelViewType.list;
        break;
      case HotelViewType.list:
        _modeView = HotelViewType.block;
        break;
      case HotelViewType.block:
        _modeView = HotelViewType.gird;
        break;
      default:
        return;
    }
    setState(() {
      _modeView = _modeView;
    });
  }

  ///On Change Sort
  void _onChangeSort() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return AppModalBottomSheet(
          selected: _currentSort,
          option: _listSort,
          onChange: (item) {
            setState(() {
              _currentSort = item;
            });
          },
        );
      },
    );
  }

  ///Export Icon for Mode View
  IconData _exportIconView() {
    switch (_modeView) {
      case HotelViewType.list:
        return Icons.view_list;
      case HotelViewType.gird:
        return Icons.view_quilt;
      case HotelViewType.block:
        return Icons.view_array;
      default:
        return Icons.help;
    }
  }

  ///_build Item Loading
  Widget _buildItemLoading(HotelViewType type) {
    switch (type) {
      case HotelViewType.gird:
        return FractionallySizedBox(
          widthFactor: 0.5,
          child: Container(
            padding: EdgeInsets.only(left: 15),
            child: AppHotelItem(
              type: _modeView,
            ),
          ),
        );

      case HotelViewType.list:
        return Container(
          padding: EdgeInsets.only(left: 15),
          child: AppHotelItem(
            type: _modeView,
          ),
        );

      default:
        return AppHotelItem(
          type: _modeView,
        );
    }
  }

  ///_build Item
  Widget _buildItem(HotelModel item, HotelViewType type) {
    switch (type) {
      case HotelViewType.gird:
        return FractionallySizedBox(
          widthFactor: 0.5,
          child: Container(
            padding: EdgeInsets.only(left: 15),
            child: AppHotelItem(
              onPressed: (item) {},
              item: item,
              type: _modeView,
            ),
          ),
        );

      case HotelViewType.list:
        return Container(
          padding: EdgeInsets.only(left: 15),
          child: AppHotelItem(
            onPressed: (item) {},
            item: item,
            type: _modeView,
          ),
        );

      default:
        return AppHotelItem(
          onPressed: (item) {},
          item: item,
          type: _modeView,
        );
    }
  }

  ///Widget build Content
  Widget _buildList() {
    if (_hotelPageModel?.hotel == null) {
      ///Build Loading
      return Wrap(
        runSpacing: 15,
        alignment: WrapAlignment.spaceBetween,
        children: List.generate(8, (index) => index).map((item) {
          return _buildItemLoading(_modeView);
        }).toList(),
      );
    }

    ///Build list
    return Wrap(
      runSpacing: 15,
      alignment: WrapAlignment.spaceBetween,
      children: _hotelPageModel.hotel.map((item) {
        return _buildItem(item, _modeView);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Translate.of(context).translate('hotel'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _onSearch,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          AppNavBar(
            currentSort: _currentSort,
            onChangeSort: _onChangeSort,
            iconModeView: _exportIconView(),
            onChangeView: _onChangeView,
            onFilter: _onChangeFilter,
          ),
          Expanded(
            child: SafeArea(
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                controller: _controller,
                header: ClassicHeader(
                  idleText: Translate.of(context).translate(
                    'pull_down_refresh',
                  ),
                  refreshingText: Translate.of(context).translate(
                    'refreshing',
                  ),
                  completeText: Translate.of(context).translate(
                    'refresh_completed',
                  ),
                  releaseText: Translate.of(context).translate(
                    'release_to_refresh',
                  ),
                  refreshingIcon: SizedBox(
                    width: 16.0,
                    height: 16.0,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                footer: ClassicFooter(
                  loadingText: Translate.of(context).translate('loading'),
                  canLoadingText: Translate.of(context).translate(
                    'release_to_load_more',
                  ),
                  idleText: Translate.of(context).translate(
                    'pull_to_load_more',
                  ),
                  loadStyle: LoadStyle.ShowWhenLoading,
                  loadingIcon: SizedBox(
                    width: 16.0,
                    height: 16.0,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    left: _modeView == HotelViewType.block ? 0 : 5,
                    right: _modeView == HotelViewType.block ? 0 : 20,
                    bottom: 16,
                  ),
                  child: _buildList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

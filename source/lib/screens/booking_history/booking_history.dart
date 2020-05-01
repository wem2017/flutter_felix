import 'package:felix_flutter/api/api.dart';
import 'package:felix_flutter/models/model.dart';
import 'package:felix_flutter/models/screen_models/screen_models.dart';
import 'package:felix_flutter/utils/utils.dart';
import 'package:felix_flutter/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookingHistory extends StatefulWidget {
  BookingHistory({Key key}) : super(key: key);

  @override
  _BookingHistoryState createState() {
    return _BookingHistoryState();
  }
}

class _BookingHistoryState extends State<BookingHistory> {
  final _controller = RefreshController(initialRefresh: false);

  BookingHistoryPageModel _bookingHistoryPage;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  ///Fetch API
  Future<void> _loadData() async {
    final ResultApiModel result = await Api.getBookingHistory();
    if (result.success) {
      setState(() {
        _bookingHistoryPage = BookingHistoryPageModel.fromJson(result.data);
      });
    }
  }

  ///On load more
  Future<void> _onLoading() async {
    await Future.delayed(Duration(seconds: 1));
    _controller.loadComplete();
  }

  ///On refresh
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    _controller.refreshCompleted();
  }

  ///On navigate chat screen
  void _onPress(BookingHistoryModel item) {}

  ///Build list
  Widget _buildList() {
    if (_bookingHistoryPage?.bookingHistory == null) {
      return ListView(
        padding: EdgeInsets.only(
          top: 15,
          left: 20,
          right: 20,
        ),
        children: List.generate(8, (index) => index).map(
          (item) {
            return Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: AppBookingHistory(),
            );
          },
        ).toList(),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.only(
        top: 15,
        left: 20,
        right: 20,
      ),
      itemCount: _bookingHistoryPage.bookingHistory.length,
      itemBuilder: (context, index) {
        final item = _bookingHistoryPage.bookingHistory[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: AppBookingHistory(
            item: item,
            onPressed: _onPress,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Translate.of(context).translate('booking'),
        ),
      ),
      body: SafeArea(
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          controller: _controller,
          header: ClassicHeader(
            idleText: Translate.of(context).translate('pull_down_refresh'),
            refreshingText: Translate.of(context).translate('refreshing'),
            completeText: Translate.of(context).translate('refresh_completed'),
            releaseText: Translate.of(context).translate('release_to_refresh'),
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
            idleText: Translate.of(context).translate('pull_to_load_more'),
            loadStyle: LoadStyle.ShowWhenLoading,
            loadingIcon: SizedBox(
              width: 16.0,
              height: 16.0,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          child: _buildList(),
        ),
      ),
    );
  }
}

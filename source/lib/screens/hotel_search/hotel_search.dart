import 'package:felix_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class HotelSearch extends StatefulWidget {
  HotelSearch({Key key}) : super(key: key);

  @override
  _HotelSearchState createState() {
    return _HotelSearchState();
  }
}

class _HotelSearchState extends State<HotelSearch> {
  final _textController = TextEditingController();
  String _currency = String.fromCharCode(0x24);

  @override
  void initState() {
    super.initState();
  }

  ///On clear search
  Future<void> _onClearTapped() async {
    await Future.delayed(Duration(milliseconds: 100));
    _textController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Translate.of(context).translate('search_title'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              children: <Widget>[],
            ),
          ),
        ),
      ),
    );
  }
}

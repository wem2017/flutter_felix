import 'package:felix_flutter/utils/utils.dart';
import 'package:felix_flutter/widgets/widget.dart';
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

  TimeOfDay _startHour = TimeOfDay(hour: 12, minute: 15);
  TimeOfDay _endHour = TimeOfDay(hour: 18, minute: 10);

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
            padding: EdgeInsets.only(
              top: 15,
              bottom: 15,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: <Widget>[
                AppTextInput(
                  hintText: Translate.of(context).translate('search'),
                  onTapIcon: _onClearTapped,
                  icon: Icon(Icons.clear),
                  controller: _textController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
                AppTimePicker(
                  startHour: _startHour,
                  endHour: _endHour,
                  onChangeStartHour: (time) {
                    setState(() {
                      _startHour = time;
                    });
                  },
                  onChangeEndHour: (time) {
                    setState(() {
                      _endHour = time;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

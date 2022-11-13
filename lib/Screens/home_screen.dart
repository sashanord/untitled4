import 'package:flutter/material.dart';
import 'package:untitled4/Data/gifs_service.dart';
import 'package:untitled4/Screens/Widgets/gifs_list.dart';

import 'Widgets/search_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _gifsService = GifsService();
  String _parameter = '';
  List<String> gifList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: _content,
        ),
      ),
    );
  }

  Widget get _content => SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SearchForm(onSearch: _changeParameter),

        if (gifList.isNotEmpty)
          GifsList(gifList)
      ],
    ),
  );

  void _changeParameter(String parameter) async {
    final dataDecoded = await _gifsService.getGifs(parameter);
    setState(() {
      _parameter = parameter;
      for (int i = 0; i < dataDecoded['data'].length; ++i){
        gifList.add(dataDecoded['data'][i]['url']);
      }
    });
  }
}



import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result_widget.dart';

import '../../application/downloads/downloads_bloc.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    TextEditingController _search = TextEditingController();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              controller: _search,
              onChanged: (text) {
                if (text.isNotEmpty) {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchMovie(query: text));
                }
              },
              backgroundColor: Colors.grey.shade900,
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              suffixInsets: const EdgeInsets.all(10),
              prefixInsets: const EdgeInsets.all(10),
              style: const TextStyle(color: kWhiteColor),
            ),
            ValueListenableBuilder(
              valueListenable: _search,
              builder: (context, value, child) => Expanded(
                  child: _search.text.isEmpty
                      ? const SearchIdleWidget()
                      : const SearchResultWidget()),
            ),
          ],
        ),
      ),
    ));
  }
}

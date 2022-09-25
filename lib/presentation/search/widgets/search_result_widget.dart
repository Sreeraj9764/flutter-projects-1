import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/infrastrcture/networkHelper.dart';
import 'package:netflix_clone/presentation/search/widgets/title_text.dart';
import '../../../application/search/search_bloc.dart';
import '../../../core/colors.dart';
import '../../../core/constants.dart';

// const String image =
//     "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight(14),
        TitleText(
            title: "Movies & TV",
            style: kGetTextStyle(kWhiteColor, 22, FontWeight.bold)),
        kHeight(10),
        Expanded(
          child: BlocConsumer<SearchBloc, SearchState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 6,
                  childAspectRatio: 2 / 3,
                  crossAxisCount: 3,
                  children: state.searchResult
                      .map((e) => SearchResultsItem(
                          image: "$kImageBaseUrl${e.posterPath}"))
                      .toList());
            },
          ),
        )
      ],
    );
  }
}

class SearchResultsItem extends StatelessWidget {
  final String image;
  const SearchResultsItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }
}

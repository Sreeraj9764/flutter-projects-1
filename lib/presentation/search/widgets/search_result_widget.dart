import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/search/widgets/title_text.dart';
import '../../../core/colors.dart';
import '../../../core/constants.dart';

const String image =
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg";

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
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 6,
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            children: List.generate(20, (index) => const SearchResultsItem()),
          ),
        )
      ],
    );
  }
}

class SearchResultsItem extends StatelessWidget {
  const SearchResultsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: const DecorationImage(
              image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }
}

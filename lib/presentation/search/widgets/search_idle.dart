import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/presentation/search/widgets/title_text.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../../infrastrcture/networkHelper.dart';

const String image =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/6oJtdTvMqpxS9sztOcmlAVdRZDI.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight(14),
        TitleText(
            title: "Top Searches",
            style: kGetTextStyle(kWhiteColor, 22, FontWeight.bold)),
        kHeight(10),
        Expanded(
          child: BlocConsumer<SearchBloc, SearchState>(
            listener: (context, state) {
              BlocProvider.of<DownloadsBloc>(context)
                  .add(const DownloadsEvent.getDownloadsImage());
            },
            builder: (context, state) {
              return ListView.separated(
                  itemBuilder: (context, index) => TopSearchItemTile(
                        listImage:
                            "$kImageBaseUrl${state.idleList[index].posterPath}",
                        title: "${state.idleList[index].title}",
                      ),
                  separatorBuilder: (context, index) => kHeight(10),
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile(
      {Key? key, required this.listImage, this.title = "jj"})
      : super(key: key);
  final String listImage;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                  image: NetworkImage(listImage), fit: BoxFit.cover)),
        ),
        kWidth(8),
        Expanded(
          child: Text(
            title,
            style: kGetTextStyle(kWhiteColor, 18, FontWeight.bold),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: Colors.grey,
          size: 46,
        )
      ],
    );
  }
}

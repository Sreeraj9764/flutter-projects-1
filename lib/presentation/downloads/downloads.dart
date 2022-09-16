import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/sizeconfig.dart';
import 'package:netflix_clone/infrastrcture/networkHelper.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      const _SmartDownload(),
      kHeight(10),
      const Section2(),
      const Section3()
    ];
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
            backgroundColor: Colors.transparent,
            stretch: true,
            flexibleSpace: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: AppBarWidget(title: "Downloads", icon: Icons.cast))),
        SliverList(delegate: SliverChildListDelegate(widgets))
      ],
    ));
  }
}

class DownloadImages extends StatelessWidget {
  const DownloadImages(
      {Key? key, required this.edgeInsets, this.angle = 0, required this.image})
      : super(key: key);
  final EdgeInsets edgeInsets;
  final double angle;
  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * (pi / 180),
      child: Container(
        margin: edgeInsets,
        height: size.width * 0.58,
        width: size.width * 0.36,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      ),
    );
  }
}

class _SmartDownload extends StatelessWidget {
  const _SmartDownload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.settings,
          color: Colors.white,
          size: 30,
        ),
        kWidth(6),
        const Text("Smart Downloads",
            style: TextStyle(
                fontSize: 14, color: kWhiteColor, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Indroducing Downloads for You",
          style: TextStyle(
              fontSize: 20, color: kWhiteColor, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
        kHeight(20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Today we’re launching Downloads For You, a new feature that automatically downloads,recommended shows or movies to your mobile device based on your\n tastes",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: BlocBuilder<DownloadsBloc, DownloadsState>(
            builder: (context, state) {
              return state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.downloadsFailureOrSuccessOption.isSome()
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.5),
                              radius: size.width * 0.4,
                            ),
                            DownloadImages(
                              edgeInsets: const EdgeInsets.only(left: 170),
                              image:
                                  '$kImageBaseUrl${state.downloads[0].posterPath}',
                              angle: 10,
                            ),
                            DownloadImages(
                              edgeInsets: const EdgeInsets.only(right: 170),
                              image:
                                  '$kImageBaseUrl${state.downloads[1].posterPath}',
                              angle: -10,
                            ),
                            DownloadImages(
                                edgeInsets: const EdgeInsets.only(bottom: 10),
                                image:
                                    '$kImageBaseUrl${state.downloads[2].posterPath}')
                          ],
                        )
                      : Text("Something Wrong");
            },
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.8,
          child: MaterialButton(
            color: kButtonColorBlue,
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            onPressed: () {},
            child: const Text(
              "Set up",
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        kHeight(6),
        MaterialButton(
          color: kButtonColorWhitw,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Text(
            "See what you can download",
            style: TextStyle(
                color: kBackgroundColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

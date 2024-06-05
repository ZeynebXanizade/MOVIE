// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_dovie/src/screens/detail_screen/widget/tabbar_widget.dart';

import '../../data/video_service.dart';
import '../../domains/models/previews_model.dart';
import '../../global/const/colors.dart';
import '../../widgets/back_save_buttons_widgets.dart';
import '../../widgets/background_image_widget.dart';
import '../../widgets/card_widget.dart';
import '../../widgets/logo_widget.dart';
import '../video/full_screen_video_player.dart';

class DetailScreen extends StatefulWidget {
  final List<Results> data;
  final int index;
  const DetailScreen({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myData = widget.data[widget.index];
    return Scaffold(
        body: Stack(children: [
          // Positioned.fill(
          //   // child: BackGroundImageWidget(

          //   //   image: NetworkImage(
          //   //       "https://image.tmdb.org/t/p/w500${myData.posterPath!}"), child: null,
          //   // ),
          // ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.7),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.rw, vertical: 30.rh),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackAndSaveButtonWidgets(
                          imageText: "back",
                        ),
                        LogoWidget(),
                        BackAndSaveButtonWidgets(
                          imageText: "save",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 182.rh,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ContainerWidget(data: widget.data, index: widget.index),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 54.rw,
                              height: 24.rh,
                              decoration: BoxDecoration(
                                  color: ConstantColor.containerColor,
                                  borderRadius: BorderRadius.circular(8.rs)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset("assets/svg/star.svg"),
                                  Text(
                                    myData.voteaverage!.toStringAsFixed(1),
                                    maxLines: 4,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: ConstantColor.orangeColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.rt),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 184.rw,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.rw),
                                child: Text(
                                  "${myData.title}",
                                  maxLines: 4,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                        color: ConstantColor.whiteColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.rt),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                        child: DetailTabbarWidget(widget.data, widget.index)),
                  ],
                ),
              ),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            backgroundColor: ConstantColor.purpleColor,
            onPressed: () async {
              final String videoId = (await fetchVideoData(myData.id!))!;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FullScreenVideoPlayer(
                  videoId: videoId,
                  movie: Results(
                    id: myData.id,
                    title: myData.title,
                    posterPath: myData.posterPath,
                    overview: myData.overview,
                    releaseDate: myData.releaseDate,
                  ),
                );
              }));
            },
            child: const Icon(
              Icons.play_arrow,
              color: ConstantColor.whiteColor,
            )));
  }
}

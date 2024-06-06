import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_dovie/src/screens/detail_screen/widget/tabbar_widget.dart';
import '../../data/favorite_services.dart';
import '../../data/video_service.dart';
import '../../domains/models/previews_model.dart';
import '../../global/const/colors.dart';
import '../../widgets/back_save_buttons_widgets.dart';
import '../../widgets/background_image_widget.dart';
import '../../widgets/card_widget.dart';
import '../../widgets/logo_widget.dart';
import '../video/full_screen_video_player.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final List<Results> data;
  final int index;
  const DetailScreen({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myData = widget.data[widget.index];
    final isFavorite = ref.watch(isFavoriteProvider(myData.id!));

    return Scaffold(
        body: Stack(children: [
          Positioned.fill(
            child: BackGroundImageWidget(
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${myData.posterPath!}"),
              child: Center(),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.7),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.rw, vertical: 30.rh),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackAndSaveButtonWidgets(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: ConstantColor.whiteColor,
                          ),
                        ),
                        LogoWidget(),
                        BackAndSaveButtonWidgets(
                          child: Icon(
                            Icons.favorite,
                            color: isFavorite.when(
                              data: (isFav) => isFav
                                  ? ConstantColor.purpleColor
                                  : ConstantColor.whiteColor,
                              loading: () => ConstantColor.whiteColor,
                              error: (_, __) => ConstantColor.whiteColor,
                            ),
                          ),
                          onTap: () async {
                            await ref
                                .read(favoritesServiceProvider)
                                .toggleFavorite(myData.id!);
                            ref.refresh(isFavoriteProvider(myData.id!));
                            ref.refresh(favoriteMoviesProvider);
                          },
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              height: 20.rh,
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
                    SizedBox(
                      height: 30.rh,
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FullScreenVideoPlayer(
                    videoId: videoId,
                    movie: Results(
                      id: myData.id,
                      title: myData.title,
                      posterPath: myData.posterPath,
                      overview: myData.overview,
                      releaseDate: myData.releaseDate,
                    ),
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.play_arrow,
              color: ConstantColor.whiteColor,
            )));
  }
}

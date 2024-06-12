import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flexify/flexify.dart';
import 'package:movie_dovie/src/screens/home_screen/widgets/gridview_widgets.dart';
import '../../../global/const/colors.dart';
import '../../../presentation/riverpod/api_providers.dart';
import '../../../presentation/riverpod/tab_notifier.dart';
import '../../../widgets/text_widgets_poppins.dart';

class MoviesCategoryWidgets extends ConsumerStatefulWidget {
  const MoviesCategoryWidgets({super.key});

  @override
  _MoviesCategoryWidgetsState createState() => _MoviesCategoryWidgetsState();
}

class _MoviesCategoryWidgetsState extends ConsumerState<MoviesCategoryWidgets>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        ref.read(tabProvider.notifier).changeTab(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(tabProvider);

    return DefaultTabController(
        initialIndex: tabIndex,
        length: 4,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorColor: ConstantColor.whiteColor,
                  isScrollable: true,
                  controller: _tabController,
                  indicatorPadding:
                      EdgeInsets.symmetric(horizontal: 7.rw, vertical: 3.rh),
                  indicatorWeight: 4.rs,
                  labelPadding: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                        child: TextButton(
                      onPressed: () {
                        _tabController.animateTo(0);
                      },
                      child: const TextWidgetPoppins(
                        text: "Now playing",
                      ),
                    )),
                    Tab(
                        child: TextButton(
                      onPressed: () {
                        _tabController.animateTo(1);
                      },
                      child: const TextWidgetPoppins(
                        text: "Upcoming",
                      ),
                    )),
                    Tab(
                        child: TextButton(
                      onPressed: () {
                        _tabController.animateTo(2);
                      },
                      child: const TextWidgetPoppins(text: "Top rated"),
                    )),
                    Tab(
                        child: TextButton(
                      onPressed: () {
                        _tabController.animateTo(3);
                      },
                      child: const TextWidgetPoppins(text: "Popular"),
                    )),
                  ]),
            ),
            Expanded(
              flex: 3,
              child: TabBarView(
                controller: _tabController,
                children: [
                  GridviewWidget(apiProviderNowPlaying),
                  GridviewWidget(apiProviderUpcoming),
                  GridviewWidget(apiProviderTopRated),
                  GridviewWidget(apiProviderPopular),
                ],
              ),
            ),
          ],
        ));
  }
}

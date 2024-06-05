import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domains/models/previews_model.dart';
import '../../../global/const/colors.dart';
import '../../../presentation/providers/api_providers.dart';
import '../../../presentation/providers/tab_notifier.dart';
import '../../../widgets/text_widgets_poppins.dart';
import '../../home_screen/widgets/gridview_widgets.dart';

class DetailTabbarWidget extends ConsumerStatefulWidget {
  final List<Results> data;
  final int index;
  const DetailTabbarWidget(this.data, this.index, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailTabbarWidgetState();
}

class _DetailTabbarWidgetState extends ConsumerState<DetailTabbarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        ref.read(tabProvider.notifier).changeTab(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(tabProvider);
    final myData = widget.data[widget.index];
    return DefaultTabController(
        initialIndex: tabIndex,
        length: 2,
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
                        text: "Description",
                      ),
                    )),
                    Tab(
                        child: TextButton(
                      onPressed: () {
                        _tabController.animateTo(1);
                      },
                      child: const TextWidgetPoppins(
                        text: "Details",
                      ),
                    )),
                  ]),
            ),
            Expanded(
              flex: 3,
              child: TabBarView(
                controller: _tabController,
                children: [
                  TextWidgetPoppins(
                    text: myData.overview.toString(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidgetPoppins(
                          text: "Release date :  ${myData.releaseDate}"),
                      TextWidgetPoppins(
                          text: "Original title :  ${myData.originalLanguage}"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

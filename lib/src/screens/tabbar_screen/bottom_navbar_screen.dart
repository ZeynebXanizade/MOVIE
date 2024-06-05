import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:movie_dovie/src/global/const/colors.dart';
import 'package:movie_dovie/src/screens/home_screen/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widget/tab_widget.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int activeIndex;

  @override
  void initState() {
    super.initState();
    activeIndex = 0;
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  const HomeScreen(),
                  const HomeScreen(),
                  0.verticalSpace,
                  const HomeScreen(),
                  const HomeScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      // //////////////////////////TABBAR//////////////////////////////////////////////

      bottomSheet: SizedBox(
        width: double.infinity,
        height: 115.rh,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Transform.scale(
              scale: 1.1,
              child: SvgPicture.asset(
                "assets/svg/navbar.svg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 15.rh,
              left: 158.rw,
              child: InkWell(
                onTap: () {
                  // Flexify.go(const WelcomeScreen());
                },
                child: CircleAvatar(
                  backgroundColor: ConstantColor.purpleColor,
                  radius: 30.rs,
                  child: SvgPicture.asset(
                    "assets/svg/search.svg",
                  ),
                ),
              ),
            ),
            BottomAppBar(
              elevation: 0,
              height: 70,
              color: Colors.transparent,
              child: TabBar(
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                controller: _tabController,
                dividerHeight: 0,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                tabs: [
                  TabWidget(
                    text: "home",
                    isActive: activeIndex == 0,
                  ),
                  TabWidget(
                    text: "favorite",
                    isActive: activeIndex == 1,
                  ),
                  0.verticalSpace,
                  TabWidget(
                    text: "notification",
                    isActive: activeIndex == 3,
                  ),
                  TabWidget(
                    text: "save",
                    isActive: activeIndex == 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

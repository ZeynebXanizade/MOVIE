import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_dovie/src/screens/profile_screen.dart/widgets/my_drawer.dart';
import 'package:movie_dovie/src/screens/profile_screen.dart/widgets/my_list_tile.dart';
import 'package:movie_dovie/src/screens/profile_screen.dart/widgets/user_account_configuration.dart';
import 'package:movie_dovie/src/widgets/background_image_widget.dart';
import '../../presentation/riverpod/user_providers.dart';

class UserProfile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return BackGroundImageWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: myDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            50.verticalSpace,
            Text(
              'P R O F I  L E',
              style: TextStyle(
                color: Color(0xFF0000000),
                fontSize: 30.rt,
                fontWeight: FontWeight.w300,
              ),
            ),
            30.verticalSpace,
            Card(
              elevation: 20.rs,
              color: Color(0xFFFFFFFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300.rw,
                    height: 150.rh,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 270.rw),
                          child: InkWell(
                            onTap: () => Flexify.go(UserAccountConfiguration()),
                            child: Icon(
                              Icons.edit,
                              size: 20.rs,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        Text(
                          '${user.name}',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 13.rt,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '${user.surname}',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 13.rt,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            25.verticalSpace,
            myListTile(
                ontap: () => Flexify.go,
                icon: Icons.dark_mode,
                text: 'T H E M E'),
            10.verticalSpace,
            myListTile(
                ontap: () => Flexify.go,
                icon: Icons.language,
                text: 'L A N G U A G E'),
            10.verticalSpace,
            myListTile(
                ontap: () => Flexify.go,
                icon: Icons.miscellaneous_services_sharp,
                text: 'S E R V I S E S'),
            10.verticalSpace,
            myListTile(
                ontap: () => Flexify.go,
                icon: Icons.login_outlined,
                text: "L O G O U T"),
          ],
        ),
      ),
    );
  }
}

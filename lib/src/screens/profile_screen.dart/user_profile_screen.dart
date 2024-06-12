import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_dovie/src/screens/profile_screen.dart/widgets/language_widgets.dart';
import 'package:movie_dovie/src/screens/profile_screen.dart/widgets/my_drawer.dart';
import 'package:movie_dovie/src/screens/profile_screen.dart/widgets/my_list_tile.dart';
import 'package:movie_dovie/src/screens/profile_screen.dart/widgets/user_account_configuration.dart';
import 'package:movie_dovie/src/widgets/background_image_widget.dart';
import '../../presentation/riverpod/user_providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            45.verticalSpace,
            myListTile(
                ontap: () => Flexify.go,
                icon: Icons.dark_mode,
                text: AppLocalizations.of(context)!.theme.toString()),
            10.verticalSpace,
            AppLanguages(),
            10.verticalSpace,
            myListTile(
                ontap: () => Flexify.go,
                icon: Icons.miscellaneous_services_sharp,
                text: AppLocalizations.of(context)!.services.toString()),
            10.verticalSpace,
            myListTile(
                ontap: () => Flexify.go,
                icon: Icons.login_outlined,
                text: AppLocalizations.of(context)!.logout.toString()),
          ],
        ),
      ),
    );
  }
}

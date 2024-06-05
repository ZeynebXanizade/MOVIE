// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

import 'package:movie_dovie/profile_screen.dart/my_list_tile.dart';
import 'package:movie_dovie/screens/login_screen.dart/login_screen.dart';
import 'package:movie_dovie/screens/register_screen/register.dart';

class myDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const myDrawer({
    Key? key,
    this.onProfileTap,
    this.onSignOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          ),
          myListTile(
              icon: Icons.home, text: 'H O M E ', ontap: () => Flexify.go),
          10.verticalSpace,
          myListTile(
            icon: Icons.person_2_outlined,
            text: 'P R O F I L E ',
            ontap: onProfileTap,
          ),
          10.verticalSpace,
          myListTile(
            ontap: onSignOut,
            icon: Icons.logout_outlined,
            text: 'L O G O U T',
          ),
        ],
      ),
    );
  }
}

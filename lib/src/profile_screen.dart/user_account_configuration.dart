import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_dovie/src/profile_screen.dart/my_drawer.dart';
import '../widgets/custom_text_field.dart';

class UserAccountConfiguration extends ConsumerStatefulWidget {
  const UserAccountConfiguration({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserAccountConfiguration();
}

class _UserAccountConfiguration
    extends ConsumerState<UserAccountConfiguration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(
          // onProfileTap: goToProfilePage,
          // onSignOut: signOut,
          ),
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 22.rs,
          color: Color(0xFF181D27),
        ),
        centerTitle: true,
        title: Text(
          'Bio-Data',
          style: TextStyle(
              color: Color(0xFF181D27),
              fontSize: 14.rt,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.rw),
        child: Column(
          children: [
            42.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.rw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/userImage.png'),
                  21.verticalSpace,
                  Text(
                    'user name example',
                    style: TextStyle(
                      color: Color(0xFF181D27),
                      fontSize: 16.rt,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    'user E-mail example',
                    style: TextStyle(
                      color: Color(0xFFABABAB),
                      fontSize: 13.rt,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            40.verticalSpace,
            CustomTextField(
              text: 'Enter your name',
              textInputAction: TextInputAction.next,
              validator: (value) => null,
            ),
            10.verticalSpace,
            CustomTextField(
              text: 'enter your surname',
              textInputAction: TextInputAction.next,
              validator: (value) => null,
            ),
            10.verticalSpace,
            CustomTextField(
              text: 'Enter your age',
              textInputAction: TextInputAction.next,
              validator: (value) => null,
            ),
            10.verticalSpace,
            CustomTextField(
              text: 'Enter your Gender',
              textInputAction: TextInputAction.done,
              validator: (value) => null,
            ),
            34.verticalSpace,
            Container(
              width: 259.82.rw,
              height: 55.rh,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFF0601B4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Udpate Profile',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 14.rt,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

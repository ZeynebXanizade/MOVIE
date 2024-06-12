import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_dovie/src/domains/models/user_model.dart';
import 'package:movie_dovie/src/global/const/colors.dart';
import '../../../presentation/riverpod/user_providers.dart';
import '../../../widgets/custom_text_field.dart';
import '../user_profile_screen.dart';

class UserAccountConfiguration extends ConsumerStatefulWidget {
  const UserAccountConfiguration({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserAccountConfiguration();
}

class _UserAccountConfiguration
    extends ConsumerState<UserAccountConfiguration> {
  final _formKey4 = GlobalKey<FormState>();
  late String name;
  late String surname;
  late String age;
  late String gender;

  @override
  void initState() {
    super.initState();
    final user = ref.read(userProvider);
    name = user.name;
    surname = user.surname;
    age = user.age;
    gender = user.age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              42.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.rw),
                child: Form(
                  key: _formKey4,
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
              ),
              40.verticalSpace,
              CustomTextField(
                initValue: name,
                onChanged: (value) {
                  setState(() {
                    name = value!;
                  });
                  return;
                },
                text: 'Enter your name',
                textInputAction: TextInputAction.next,
                validator: (value) => null,
              ),
              10.verticalSpace,
              CustomTextField(
                initValue: surname,
                onChanged: (value) {
                  setState(() {
                    surname = value!;
                  });
                  return;
                },
                text: 'enter your surname',
                textInputAction: TextInputAction.next,
                validator: (value) => null,
              ),
              10.verticalSpace,
              CustomTextField(
                initValue: age,
                onChanged: (value) {
                  setState(() {
                    age = value!;
                  });
                  return;
                },
                text: 'Enter your age',
                textInputAction: TextInputAction.next,
                validator: (value) => null,
              ),
              10.verticalSpace,
              CustomTextField(
                initValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                  return;
                },
                text: 'Enter your Gender',
                textInputAction: TextInputAction.done,
                validator: (value) => null,
              ),
              34.verticalSpace,
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(ConstantColor.buttonColorsTwo),
                    alignment: Alignment.center,
                  ),
                  onPressed: () {
                    if (_formKey4.currentState!.validate()) {
                      User updatedUser = User(
                          name: name,
                          surname: surname,
                          age: age,
                          gender: gender);
                      ref.read(userProvider.notifier).updateUser(updatedUser);
                      Flexify.go(UserProfile());
                    }
                  },
                  child: Text(
                    'Update Profile',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14.rt,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

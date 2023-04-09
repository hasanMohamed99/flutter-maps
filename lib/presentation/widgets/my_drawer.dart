import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:flutter_maps/constants/strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  Widget buildDrawerHeader(context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsetsDirectional.fromSTEB(70, 10, 70, 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blue[100],
          ),
          child: Image.asset(
            'assets/images/profile.png',
            fit: BoxFit.cover,
          ),
        ),
        const Text(
          'Hasan Mohamed',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        BlocProvider<PhoneAuthCubit>(
          create: (context) => phoneAuthCubit,
          child: Text(
            phoneAuthCubit.getLoggedInUser().phoneNumber!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDrawerListItem({
    required IconData leadingIcon,
    required String title,
    Widget? trailing,
    Function()? onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: color ?? MyColors.blue,
      ),
      title: Text(title),
      trailing: trailing ??
          const Icon(
            Icons.arrow_right,
            color: MyColors.blue,
          ),
      onTap: onTap,
    );
  }

  Widget buildDrawerListItemsDivider() {
    return const Divider(
      height: 0,
      thickness: 1,
      indent: 18,
      endIndent: 24,
    );
  }

  Widget buildIcon(
      {required IconData icon, required String url, required String path}) {
    return InkWell(
      onTap: () => _launchUrl(url, path),
      child: Icon(
        icon,
        color: MyColors.blue,
        size: 35,
      ),
    );
  }

  Widget buildSocialMediaIcon() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: Row(
        children: [
          buildIcon(
              icon: FontAwesomeIcons.facebook,
              url: 'www.facebook.com',
              path: '/hasan.ibrahiem.9'),
          const SizedBox(
            width: 15,
          ),
          buildIcon(
              icon: FontAwesomeIcons.github,
              url: 'github.com',
              path: '/hasanMohamed99'),
          const SizedBox(
            width: 15,
          ),
          buildIcon(
              icon: FontAwesomeIcons.linkedin,
              url: 'www.linkedin.com',
              path: '/in/hasan-mohamed-001a21256'),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url, String path) async {
    final Uri uri = Uri(scheme: 'https', host: url, path: path);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Cant\'t launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 280,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[100]),
              child: buildDrawerHeader(context),
            ),
          ),
          buildDrawerListItem(leadingIcon: Icons.person, title: 'My Profile'),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
              leadingIcon: Icons.history,
              title: 'Places History',
              onTap: () {}),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
              leadingIcon: Icons.settings, title: 'Settings', onTap: () {}),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
              leadingIcon: Icons.help, title: 'Help', onTap: () {}),
          BlocProvider<PhoneAuthCubit>(
            create: (context) => phoneAuthCubit,
            child: buildDrawerListItem(
              leadingIcon: Icons.logout,
              title: 'LOGOUT',
              onTap: () async {
                await phoneAuthCubit.logout();
                if (context.mounted) {
                  Navigator.of(context)
                      .pushReplacementNamed(MyStrings.loginScreen);
                }
              },
              color: Colors.red,
              trailing: const SizedBox(),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          buildSocialMediaIcon(),
        ],
      ),
    );
  }
}

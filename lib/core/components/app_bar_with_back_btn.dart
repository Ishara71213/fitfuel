import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWithBackBtn extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWithBackBtn({super.key, this.title = ""});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            width: 1,
            color: DarkTheme.kGreyMediumShade,
          ),
        ),
      ),
      child: AppBar(
        title: Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: DarkTheme.kGreyColor,
          ),
          textAlign: TextAlign.center,
        ),
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: DarkTheme.kGreyColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: DarkTheme.kAppBgColor,
      ),
    );
  }
}

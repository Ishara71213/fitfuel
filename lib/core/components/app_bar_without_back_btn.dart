import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWithoutBackBtn extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  const AppBarWithoutBackBtn({super.key, this.title = ""});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            width: 0.7,
            color: DarkTheme.kDarkerGreyShade,
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
        automaticallyImplyLeading: false,
        backgroundColor: DarkTheme.kBlackMediumShade,
      ),
    );
  }
}

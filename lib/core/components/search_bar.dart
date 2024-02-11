import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final ValueChanged<String> searchCallBack;

  const SearchBarWidget({super.key, required this.searchCallBack});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.searchCallBack,
      style: kInputFieldText,
      controller: _searchController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        hintText: "Search Clubs",
        prefixIconColor: DarkTheme.kGreyMediumShade,
        hintStyle: TextStyle(color: DarkTheme.kGreyMediumShade),
        prefixIcon: const Icon(Icons.search, size: 20),
        filled: true,
        fillColor: DarkTheme.kDarkGreyShade,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: DarkTheme.kGreyMediumShade)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: DarkTheme.kErrorColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: DarkTheme.kErrorColor)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
              width: 1.4,
              style: BorderStyle.solid,
              color: DarkTheme.kDarkerGreyShade),
        ),
      ),
    );
  }
}

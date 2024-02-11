import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/search_bar.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClubSearchBar extends StatefulWidget {
  const ClubSearchBar({
    super.key,
  });

  @override
  State<ClubSearchBar> createState() => _ClubSearchBarState();
}

class _ClubSearchBarState extends State<ClubSearchBar> {
  late ClubsCubit clubCubit;

  @override
  void initState() {
    super.initState();
    clubCubit = BlocProvider.of<ClubsCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DarkTheme.kDarkerGreyShade,
      padding: const EdgeInsets.only(top: 20, bottom: 8, left: 14, right: 14),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SearchBarWidget(
              searchCallBack: (value) {},
            ),
          ),
          const SizedBox(width: 6),
          Material(
            type: MaterialType.transparency,
            child: Ink(
              decoration: BoxDecoration(
                color: DarkTheme.kDarkGreyShade,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  clubCubit.toggleFilter('open');
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Image.asset(
                    'assets/icons/filter.png',
                    height: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

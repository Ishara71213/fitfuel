import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:fitfuel/core/components/app_bar_with_back_btn.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/saved_club/saved_club_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/widgets/club_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedClubsScreen extends StatefulWidget {
  const SavedClubsScreen({super.key});

  @override
  State<SavedClubsScreen> createState() => _SavedClubsScreenState();
}

class _SavedClubsScreenState extends State<SavedClubsScreen> {
  ScrollController scrollController = ScrollController();
  late SavedClubCubit savedNewsCubit;
  @override
  void initState() {
    super.initState();
    savedNewsCubit = BlocProvider.of<SavedClubCubit>(context);
    savedNewsCubit.lodaSavedClubList();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackBtn(
        title: "Saved Clubs",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<SavedClubCubit, SavedClubState>(
              builder: (context, state) {
                if (state is SavedClubLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SavedClubLodaingSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: savedNewsCubit.savedClubLst.length,
                    itemBuilder: (context, index) {
                      return ClubDetailCard(
                          club: savedNewsCubit.savedClubLst[index]);
                    },
                  );
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        "No Saved Clubs",
                        style: kGreySmallesttextStyle,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

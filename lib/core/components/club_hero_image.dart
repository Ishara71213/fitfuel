import 'package:flutter/material.dart';

import '../widgets_library/widgets_library.dart';

class ClubHeroImage extends StatelessWidget {
  const ClubHeroImage({super.key, this.imageUrl});

  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CachedNetworkImageClipRect(
            margin: const EdgeInsets.only(top: 16),
            height: 160,
            width: screenSize.width - 40,
            borderRadius: 8,
            imageUrl: imageUrl ??
                "https://placehold.co/${screenSize.width - 40}x180/png",
          ),
        ],
      ),
    );
  }
}

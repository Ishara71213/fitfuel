part of 'image_widgets_library.dart';

class CachedNetworkImageClipRect extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsetsGeometry margin;
  final String imageUrl;
  const CachedNetworkImageClipRect(
      {super.key,
      required this.height,
      required this.width,
      required this.borderRadius,
      required this.imageUrl,
      this.margin = const EdgeInsets.only(top: 0)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImageWidget(
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}

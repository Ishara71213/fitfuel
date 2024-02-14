part of 'button_widgets_library.dart';

class PageRedirectButtonCustom extends StatelessWidget {
  final String buttonText;
  final IconData? leftIconData;
  final IconData? rightIconData;
  final VoidCallback onPressed;
  final ButtonStyle style;
  final Color color;

  const PageRedirectButtonCustom({
    Key? key,
    required this.buttonText,
    this.leftIconData,
    this.rightIconData,
    required this.onPressed,
    required this.style,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leftIconData != null)
            Icon(
              leftIconData,
              color: color,
            ),
          const SizedBox(width: 8),
          Text(
            buttonText,
            style: TextStyle(
              color: color,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          if (rightIconData != null)
            Icon(
              rightIconData,
              color: color,
            ),
        ],
      ),
    );
  }
}

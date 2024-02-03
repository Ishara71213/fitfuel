part of 'button_widgets_library.dart';

class FilledButtonCustom extends StatelessWidget {
  final String initText;
  final String? loadingText;
  final String? successText;
  final States? state;
  final VoidCallback onPressed;

  const FilledButtonCustom(
      {super.key,
      required this.initText,
      required this.onPressed,
      this.state,
      this.loadingText,
      this.successText});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        style: Theme.of(context).filledButtonTheme.style,
        child: (States.loading == state)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(loadingText != null ? loadingText.toString() : initText,
                      style: kFilledButtonTextstyle),
                  const SizedBox(width: 12),
                  const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                ],
              )
            : (States.success == state)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          successText != null
                              ? successText.toString()
                              : initText,
                          style: kFilledButtonTextstyle),
                      const SizedBox(width: 4),
                      const SizedBox(
                        height: 22,
                        width: 22,
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                : Text(initText, style: kFilledButtonTextstyle));
  }
}

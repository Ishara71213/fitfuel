part of 'button_widgets_library.dart';

class FilledButtonWithLoader extends StatelessWidget {
  final String initText;
  final String? loadingText;
  final String? successText;
  final States state;
  final VoidCallback onPressed;

  const FilledButtonWithLoader(
      {super.key,
      required this.initText,
      required this.onPressed,
      required this.state,
      this.loadingText,
      this.successText});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(60),
            backgroundColor: DarkTheme.kPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0))),
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

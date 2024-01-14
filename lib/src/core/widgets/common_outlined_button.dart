import 'package:learning_app/src/app/app.dart';

class CommonOutlinedButton extends StatelessWidget {
  final String? label;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? labelColor;
  final bool isLoading;
  const CommonOutlinedButton({
    Key? key,
    this.label,
    this.height,
    this.width,
    this.margin,
    this.onPressed,
    this.backgroundColor,
    this.labelColor,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 52,
      width: width ?? double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1,
            color: backgroundColor ?? Colors.purple,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              )
            : Text(
                label ?? 'Label',
                style: AppStyles.tsBlackRegular14.copyWith(
                  color: labelColor,
                ),
              ),
        onPressed: onPressed ?? null,
      ),
    );
  }
}

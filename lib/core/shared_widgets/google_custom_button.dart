import 'package:flutter/material.dart';

class GoogleCustomButton extends StatelessWidget {
  const GoogleCustomButton({super.key,  this.color = Colors.white, this.onPressed, this.height = 53, this.width = double.infinity, this.borderRadius = 10, this.marginTop = 0, this.marginBottom = 0, this.marginRight = 0, this.marginLeft = 0, this.loading = false, this.text, this.fontWeight, this.fontSize = 16, this.textColor, this.border, this.textStyle, this.textWidget, this.boxShadow});
final Color color;
  final void Function()? onPressed;

  final double height;
  final double width;
  final double? borderRadius;
  final double marginTop;
  final double marginBottom;
  final double marginRight;
  final double marginLeft;
  final bool loading;
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final Border? border;
  final TextStyle? textStyle;
  final Widget? textWidget;
  final List<BoxShadow>? boxShadow;
    

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.only(
            top: marginTop,
            bottom: marginBottom,
            right: marginRight,
            left: marginLeft,
          
        ),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: color,
          border: border,
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Center(
          child: loading
              ? SizedBox(
                  height: height - 16,
                  width: height - 16,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color:Colors.white,
                  ),
                )
              : FittedBox(
                  fit: BoxFit.scaleDown,
                  child: textWidget ??
                      Text( 
                        text!,
                        style: textStyle,
                        textAlign: TextAlign.center,
                        
                      ),
                ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key,
    this.width = 24.0,
    this.height = 24.0,
    this.color,
    this.iconSize = 15,
    this.circleShape = false,
    this.checkColor,
    this.style,
  });

  final double width;
  final double height;
  final Color? color;
  final String title;
  final bool circleShape;
  final bool value;
  final TextStyle? style;

  final double iconSize;
  final Color? checkColor;
  final void Function(bool value) onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isChecked = widget.value;
  }

  @override
  void didUpdateWidget(final CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    isChecked = widget.value;
  }

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: () {
          setState(() => isChecked = !isChecked);
          widget.onChanged.call(isChecked);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: widget.value,
                checkColor: widget.checkColor,
                onChanged: (final value) => widget.onChanged(value!),
                activeColor:
                    widget.color ?? Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                widget.title,
                style: widget.style ?? const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      );
}

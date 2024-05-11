import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final Function() onIncrementSelected;
  final Function() onDecrementSelected;
  final int label;
  final Axis orientation;

  const CounterButton({
    super.key,
    required this.onIncrementSelected,
    required this.onDecrementSelected,
    required this.label,
    this.orientation = Axis.horizontal,
  });

  Widget button(Icon icon, Function() onTap) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(const Size(36, 36)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Colors.orange,
      onPressed: () => onTap(),
      child: icon,
    );
  }

  List<Widget> body(BuildContext context) {
    final theme = Theme.of(context);
    return [
      button(const Icon(Icons.remove), onDecrementSelected),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "$label",
          style: theme.textTheme.labelMedium,
        ),
      ),
      button(const Icon(Icons.add), onIncrementSelected),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return orientation == Axis.horizontal
        ? Row(mainAxisAlignment: MainAxisAlignment.end, children: body(context))
        : Column(children: body(context).reversed.toList());
  }
}

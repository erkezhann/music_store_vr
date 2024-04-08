import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback? onTap;
  final String priceLabel;
  final String priceValue;
  final String buttonLabel;

  const BottomBar({
    super.key,
    this.onTap,
    this.priceLabel = "Цена",
    required this.priceValue,
    this.buttonLabel = "Добавить в корзину",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  priceLabel,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 5),
              FittedBox(
                child: Text(
                  priceValue,
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: onTap,
            child: Text(buttonLabel, style: theme.textTheme.labelMedium),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_store/core/app_asset.dart';

enum EmptyWidgetType { cart, favorite }

class EmptyWidget extends StatelessWidget {
  final EmptyWidgetType type;
  final String title;

  const EmptyWidget({
    super.key,
    this.type = EmptyWidgetType.cart,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          type == EmptyWidgetType.cart
              ? Expanded(
                  child: Image.asset(
                  AppAsset.emptyCart,
                  width: 230,
                ))
              : Image.asset(AppAsset.emptyFavorite),
          const SizedBox(height: 10),
          Text(title, style: theme.textTheme.bodyMedium)
        ],
      ),
    );
  }
}

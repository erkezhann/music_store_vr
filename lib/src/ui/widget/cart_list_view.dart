import 'package:flutter/material.dart';
import 'package:music_store/core/app_extension.dart';
import 'package:music_store/src/model/instrument.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
    required this.counterButton,
    required this.instrumentItems,
  });

  final Widget Function(Instrument instrument) counterButton;
  final List<Instrument> instrumentItems;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      itemCount: instrumentItems.length,
      itemBuilder: (_, index) {
        Instrument instrument = instrumentItems[index];
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: SizedBox(
                    height: 300,
                    child: Image.asset(
                      instrument.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    instrument.title.addOverFlow,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$${instrument.price}",
                    style: theme.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Цвет: ", style: theme.textTheme.labelMedium),
                      CircleAvatar(
                        radius: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            color: instrument.colors
                                .where((element) => element.isSelected)
                                .toList()
                                .first
                                .color,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              // Spacer(),
              counterButton(instrument)
            ],
          ).fadeAnimation(0.4 * index),
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(padding: EdgeInsets.only(bottom: 15));
      },
    );
  }
}

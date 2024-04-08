import 'package:flutter/material.dart';
import 'package:music_store/core/app_extension.dart';
import 'package:music_store/src/model/instrument.dart';

class InstrumentListView extends StatelessWidget {
  final bool isHorizontal;
  final Function(Instrument instrument)? onTap;
  final List<Instrument> instrumentList;
  final Color? color;

  const InstrumentListView({
    super.key,
    this.isHorizontal = true,
    this.onTap,
    required this.instrumentList,
    this.color,
  });

  Widget _instrumentModel(Instrument instrument) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: instrument.color,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: Image.asset(
          fit: BoxFit.contain,
          instrument.model,
          width: 200,
          height: 250,
        ),
      ),
    ).fadeAnimation(0.4);
  }

  Widget _listViewItem(Instrument instrument, int index, BuildContext context) {
    final theme = Theme.of(context);
    Widget widget;
    widget = isHorizontal == true
        ? Column(
            children: [
              Hero(
                tag: index,
                child: _instrumentModel(instrument),
              ),
              const SizedBox(height: 10),
              Text(instrument.title.addOverFlow,
                      style: theme.textTheme.labelMedium)
                  .fadeAnimation(0.8),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _instrumentModel(instrument),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(instrument.title, style: theme.textTheme.bodyMedium)
                          .fadeAnimation(0.8),
                      const SizedBox(height: 5),
                      Text(
                        instrument.description,
                        style: theme.textTheme.labelMedium,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ).fadeAnimation(1.4)
                    ],
                  ),
                ),
              )
            ],
          );

    return GestureDetector(
      onTap: () => onTap?.call(instrument),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isHorizontal == true
        ? SizedBox(
            height: 320,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: instrumentList.length,
              itemBuilder: (_, index) {
                Instrument instrument = instrumentList[index];
                return _listViewItem(instrument, index, context);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(padding: EdgeInsets.only(left: 15));
              },
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            reverse: true,
            physics: const ClampingScrollPhysics(),
            itemCount: instrumentList.length,
            itemBuilder: (_, index) {
              Instrument instrument = instrumentList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 10),
                child: _listViewItem(instrument, index, context),
              );
            },
          );
  }
}

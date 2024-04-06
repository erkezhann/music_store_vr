import 'package:flutter/material.dart';
import 'package:music_store/core/app_extension.dart';
import 'package:music_store/core/app_style.dart';
import 'package:music_store/src/model/instrument.dart';

class InstrumentListView extends StatelessWidget {
  final bool isHorizontal;
  final Function(Instrument instrument)? onTap;
  final List<Instrument> instrumentList;

  const InstrumentListView({
    super.key,
    this.isHorizontal = true,
    this.onTap,
    required this.instrumentList,
  });

  Widget _instrumentModel(String model) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(model, width: 150, height: 150),
    ).fadeAnimation(0.4);
  }

  Widget _listViewItem(Instrument instrument, int index) {
    Widget widget;
    widget = isHorizontal == true
        ? Column(
            children: [
              Hero(
                tag: index,
                child: _instrumentModel(instrument.model),
              ),
              const SizedBox(height: 10),
              Text(instrument.title.addOverFlow, style: h4Style)
                  .fadeAnimation(0.8),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _instrumentModel(instrument.model),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(instrument.title, style: h4Style).fadeAnimation(0.8),
                      const SizedBox(height: 5),
                      Text(
                        instrument.description,
                        style: h5Style.copyWith(fontSize: 12),
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
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: instrumentList.length,
              itemBuilder: (_, index) {
                Instrument instrument = instrumentList[index];
                return _listViewItem(instrument, index);
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
                child: _listViewItem(instrument, index),
              );
            },
          );
  }
}

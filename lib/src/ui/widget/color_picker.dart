import 'package:flutter/material.dart';
import 'package:music_store/src/model/instrument.dart';
import 'package:music_store/src/model/instrument_color.dart';

class ColorPicker extends StatefulWidget {
  final List<InstrumentColor> colors;
  final Instrument instrument;

  const ColorPicker(this.colors, this.instrument, {super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                widget.colors[index].isSelected
                    ? CircleAvatar(
                        backgroundColor:
                            widget.colors[index].color.withOpacity(0.5),
                        radius: 18,
                      )
                    : const IgnorePointer(),
                InkWell(
                  onTap: () {
                    for (var element in widget.colors) {
                      element.isSelected = false;
                    }
                    setState(
                      () {
                        widget.colors[index].isSelected = true;
                        widget.instrument.selectedModel =
                            widget.instrument.secondModel;
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: widget.colors[index].color,
                    radius: 15,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

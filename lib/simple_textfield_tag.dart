library simple_textfield_tag;

import 'package:flutter/material.dart';

class SimpleTextFieldTag extends StatefulWidget {
  final List<String> initialTags;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? tagTextStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color chipBackgroundColor;
  final Color deleteIconColor;
  final BorderSide chipBorderSide;
  final TextEditingController? controller;
  final Function(String)? onTagAdded;
  final Function(String)? onTagRemoved;

  const SimpleTextFieldTag({
    Key? key,
    this.initialTags = const [],
    this.labelText,
    this.labelStyle,
    this.tagTextStyle,
    this.hintStyle,
    this.hintText,
    this.chipBackgroundColor = Colors.white,
    this.deleteIconColor = Colors.red,
    this.chipBorderSide = const BorderSide(color: Colors.blue),
    this.controller,
    this.onTagAdded,
    this.onTagRemoved,
  }) : super(key: key);

  @override
  _SimpleTextFieldTagState createState() => _SimpleTextFieldTagState();
}

class _SimpleTextFieldTagState extends State<SimpleTextFieldTag> {
  late TextEditingController tagController;
  late List<String> tags;

  @override
  void initState() {
    super.initState();
    tagController = widget.controller ?? TextEditingController();
    tags = List.from(widget.initialTags);
  }

  void addTag(String tag) {
    if (tag.isNotEmpty && !tags.contains(tag)) {
      setState(() {
        tags.add(tag);
      });
      tagController.clear();
      if (widget.onTagAdded != null) {
        widget.onTagAdded!(tag);
      }
    }
  }

  void removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });
    if (widget.onTagRemoved != null) {
      widget.onTagRemoved!(tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Wrap(
            spacing: 8.0,
            children: tags.map((tag) {
              return Chip(
                backgroundColor: widget.chipBackgroundColor,
                deleteIconColor: widget.deleteIconColor,
                side: widget.chipBorderSide,
                label: Text(
                  tag,
                  style: widget.tagTextStyle ??
                      const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                ),
                deleteIcon: const Icon(
                  Icons.close,
                  size: 12,
                ),
                onDeleted: () => removeTag(tag),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 48,
            child: TextField(
              controller: tagController,
              cursorHeight: 18,
              decoration: InputDecoration(
                labelText: widget.labelText ?? "Enter tags",
                labelStyle: widget.labelStyle ??
                    const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: widget.hintText ?? "Enter tags",
                hintStyle: widget.hintStyle ??
                    const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    addTag(tagController.text);
                  },
                ),
              ),
              onSubmitted: (value) {
                addTag(value);
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      tagController.dispose();
    }
    super.dispose();
  }
}

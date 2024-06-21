import 'package:flutter/material.dart';

class BuildDropDown extends StatefulWidget {
  const BuildDropDown({super.key, required this.hintText});
  final String hintText;
  @override
  State<BuildDropDown> createState() => _BuildDropDownState();
}

class _BuildDropDownState extends State<BuildDropDown> {
  String? _selectedDropDownText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      value: _selectedDropDownText,
      items: const [
        DropdownMenuItem(
          value: 'data1',
          child: Text('data1'),
        ),
        DropdownMenuItem(
          value: 'data2',
          child: Text('data2'),
        ),
        DropdownMenuItem(
          value: 'data3',
          child: Text('data3'),
        ),
        DropdownMenuItem(
          value: 'data4',
          child: Text('data4'),
        ),
      ],
      onChanged: (String? value) {
        setState(() {
          _selectedDropDownText = value;
        });
      },
      hint: Text(
        widget.hintText,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 12, color: Color(0xFFBDBDBD)),
      ),
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down_rounded,
          color: Color(0xFFBDBDBD)),
      borderRadius: BorderRadius.circular(10),
    );
  }
}

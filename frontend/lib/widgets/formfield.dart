import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iiitb_hogwarts/widgets/theme.dart';

class FormFieldWidget extends StatefulWidget {
  final String? labelText;
  // final void Function(String)? onChanged;
  final bool enabled;
  final Widget? icon;
  const FormFieldWidget(
      {Key? key,
      required this.labelText,
      // required this.onChanged,
      required this.enabled,
      this.icon})
      : super(key: key);

  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            onTap: _requestFocus,
            // onChanged: widget.onChanged,
            focusNode: _focusNode,
            enabled: widget.enabled,
            decoration: InputDecoration(
                // icon: widget.icon,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: widget.icon,
                ),
                labelText: widget.labelText,
                labelStyle: TextStyle(
                  color: _focusNode.hasFocus ? Colors.white : Colors.white54,
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white38)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.white54,
                    ))),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ShowMoreButton extends StatefulWidget {
  final void Function(bool isMore) onPressed;

  const ShowMoreButton(this.onPressed, {Key? key}) : super(key: key);

  @override
  State<ShowMoreButton> createState() => _ShowMoreButtonState();
}

class _ShowMoreButtonState extends State<ShowMoreButton> {
  bool _isMore = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if(_isMore){
            _isMore = false;
          }
          else{
            _isMore = true;
          }
          print(_isMore);
          widget.onPressed(_isMore);
          setState(() {});
        },
        child: Text(_isMore ? "Show More..." : "Show Less..."));
  }
}

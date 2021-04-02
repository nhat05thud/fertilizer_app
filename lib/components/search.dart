import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function onChanged;

  const SearchBar({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Tìm kiếm...',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.only(
            right: 30,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 16.0, left: 24.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
        onChanged: (text) {
          onChanged(text);
        },
      ),
    );
  }
}

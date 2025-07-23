import 'package:flutter/material.dart';
import 'package:news_app/screens/post/widget/create_news_bottombar.dart';
import 'package:news_app/screens/post/widget/create_news_header.dart';
import 'package:dotted_border/dotted_border.dart';

class CreateNewsScreen extends StatelessWidget {
  const CreateNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreateNewsHeader(),
                      _AddImageContainer(),
                      SizedBox(height: 4),
                      _TitleTextField(),
                      SizedBox(height: 4),
                      _DescriptionTextField(),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: _FormatOptions(),
                ),
              ],
            ),
            SizedBox(height: 8),
            CreateNewsBottombar(),
          ],
        ),
      ),
    );
  }
}

class _AddImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(8),
        color: Colors.black,
        strokeWidth: 2,
        dashPattern: [8, 4],
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromRGBO(200, 200, 200, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.add), Text("Add Cover Photo")],
          ),
        ),
      ),
    );
  }
}

class _TitleTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 1,
      decoration: InputDecoration(hintText: "News title"),
      style: TextStyle(fontSize: 24),
    );
  }
}

class _DescriptionTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 5,
      decoration: InputDecoration(
        hintText: "Add News/Article",
        border: InputBorder.none,
      ),
      style: TextStyle(fontSize: 16),
    );
  }
}

class _FormatOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(200, 200, 200, 1),
              offset: Offset(0, -0.5),
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.format_bold),
              SizedBox(width: 12),
              Icon(Icons.format_italic),
              SizedBox(width: 12),
              Icon(Icons.format_list_numbered),
              SizedBox(width: 12),
              Icon(Icons.format_list_bulleted),
              SizedBox(width: 12),
              Icon(Icons.insert_link),
            ],
          ),
        ),
      ),
    );
  }
}

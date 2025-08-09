import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/network/post_service.dart';
import 'package:news_app/screens/post/widget/create_news_header.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:news_app/widgets/custom_snackbar.dart';

class CreateNewsScreen extends StatefulWidget {
  const CreateNewsScreen({super.key});

  @override
  State<CreateNewsScreen> createState() => _CreateNewsScreenState();
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final PostService apiService = PostService();

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void sendPostRequest() async {
    final title = _titleController.text.trim();
    final desc = _descController.text.trim();

    if (title.isEmpty || desc.isEmpty) {
      showCustomSnackbar(context, "both title and description are required!");
      return;
    }

    try {
      final response = await apiService.postJSONNews({
        'title': title,
        'body': desc,
        'userId': 1,
      });

      if (response.statusCode == 201) {
        print("Post successful: ${response.data}");
        showCustomSnackbar(
          context,
          "Title : ${response.data['title']}\nDescription : ${response.data['body']}  has been posted",
        );
        Navigator.pushNamed(context, '/profile/view');
      } else {
        print("Failed: ${response.statusCode}");
        showCustomSnackbar(context, "Failed to post news :(");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

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
                      _TitleTextField(controller: _titleController),
                      SizedBox(height: 4),
                      _DescriptionTextField(controller: _descController),
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0, -0.5),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Aa",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.format_align_left),
                        SizedBox(width: 16),
                        Icon(Icons.image_outlined),
                        SizedBox(width: 16),
                        Icon(Icons.more_horiz),
                      ],
                    ),
                    GestureDetector(
                      onTap: sendPostRequest,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Publish",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
  final TextEditingController controller;

  const _TitleTextField({required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 1,
      decoration: InputDecoration(hintText: "News title"),
      style: TextStyle(fontSize: 24),
    );
  }
}

class _DescriptionTextField extends StatelessWidget {
  final TextEditingController controller;
  const _DescriptionTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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

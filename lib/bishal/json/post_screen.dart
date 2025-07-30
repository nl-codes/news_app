import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/network/news_service.dart';
import 'package:news_app/screens/profile/widget/profile_picture_containter.dart';

class PostScreen extends StatefulWidget {
  PostScreen({super.key});
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  State<PostScreen> createState() => _PostScreenState();
  final NewsService apiService = NewsService();

  void sendPostRequest() async {
    final title = _titleController.text.trim();
    final desc = _descController.text.trim();

    if (title.isEmpty || desc.isEmpty) {
      print("Either field is empty");
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
      } else {
        print("Failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final NewsService apiService = NewsService();

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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Both title and description are required")),
      );
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
      } else {
        print("Failed: ${response.statusCode}");
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back),
                          Text(
                            "Post your News",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_back, color: Colors.white),
                        ],
                      ),
                      SizedBox(height: 16),
                      ProfilePictureContainter(),
                      SizedBox(height: 16),
                      NewsTextField(
                        label: "Title",
                        isRequired: true,
                        fieldController: _titleController,
                      ),
                      NewsTextField(
                        label: "Description",
                        isRequired: true,
                        fieldController: _descController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, -0.3),
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 32.0,
                ),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      textStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: sendPostRequest,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text("POST NEWS"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final TextEditingController fieldController;
  const NewsTextField({
    required this.label,
    required this.isRequired,
    required this.fieldController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isRequired
            ? Row(
                children: [
                  Text(label),
                  Text("*", style: TextStyle(color: Colors.red)),
                ],
              )
            : Text(label),
        TextField(
          decoration: InputDecoration(border: OutlineInputBorder()),
          controller: fieldController,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

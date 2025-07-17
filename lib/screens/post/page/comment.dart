import 'package:flutter/material.dart';
import 'package:news_app/screens/post/widget/comment_card.dart';
import 'package:news_app/screens/post/widget/comment_reply_card.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Navbar(),
            ),
            const SizedBox(height: 12),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CommentCard(
                      commentor: "Kuchiki Rukia",
                      commentorProfile:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfthYHT8S4PFFgUONUki1todNQ0BvJ_RTZTQ&s",
                      commentText:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      isSeeMore: false,
                    ),
                    ReplyCard(
                      commentor: "Madelyn Saris",
                      commentorProfile:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZMwj0BJJ4sCVh-3ERfJB8ibj_t4jKWIVB2w&s",
                      commentText:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      isSeeMore: true,
                      isLiked: true,
                    ),
                    SizedBox(height: 12),
                    CommentCard(
                      commentor: "Marley Botos",
                      commentorProfile:
                          "https://i.pinimg.com/564x/69/08/45/690845dbe2f12d979b18b192d3217f81.jpg",
                      commentText:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      isSeeMore: true,
                    ),
                    SizedBox(height: 12),
                    CommentCard(
                      commentor: "Alfonso Septimus",
                      commentorProfile:
                          "https://i.pinimg.com/736x/5b/80/c0/5b80c0477383b72ed1c6d1b7fe8d0a4b.jpg",
                      commentText:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      isSeeMore: true,
                      isLiked: true,
                    ),
                    SizedBox(height: 12),
                    CommentCard(
                      commentor: "Omar Herwitz",
                      commentorProfile:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTey3f0bdDgw6ZnNu96Kce7ck_TFR1zoryH7w&s",
                      commentText:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      isSeeMore: false,
                    ),
                    SizedBox(height: 12),
                    CommentCard(
                      commentor: "Chuuya",
                      commentorProfile:
                          "https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg",
                      commentText:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      isSeeMore: false,
                    ),
                  ],
                ),
              ),
            ),

            // Fixed FooterInput
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: FooterInput(),
            ),
          ],
        ),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.arrow_back),
        Text("Comments", style: TextStyle(fontSize: 18)),
        Icon(Icons.arrow_back, color: Colors.white),
      ],
    );
  }
}

class FooterInput extends StatelessWidget {
  const FooterInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type your comment",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            iconSize: 20,
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            minimumSize: Size(48, 48),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Icon(Icons.send),
        ),
      ],
    );
  }
}

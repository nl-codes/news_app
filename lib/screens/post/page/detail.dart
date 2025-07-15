import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Navbar(),
                    SizedBox(height: 10),
                    AccountHeader(),
                    SizedBox(height: 10),
                    BodyDescription(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Footer(),
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
        Row(
          children: [
            Icon(Icons.share_outlined),
            SizedBox(width: 12),
            Icon(Icons.more_vert),
          ],
        ),
      ],
    );
  }
}

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.network(
              'https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png',
              height: 50,
              width: 50,
            ),
            SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("BBC News", style: TextStyle(fontWeight: FontWeight.w900)),
                Text("14m ago"),
              ],
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text("Following"),
        ),
      ],
    );
  }
}

class BodyDescription extends StatelessWidget {
  const BodyDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 250,
          child: Image.network(
            'https://t4.ftcdn.net/jpg/07/85/99/79/360_F_785997974_bFmPEPwMxgcdBCzfSmd0bZIdcgg3pnaf.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Text("Europe", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(
          "Ukraine's President Zelensky to BBC: Blood money being paid for Russian oil",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Ukrainian President Volodymyr Zelensky has accusedt European countries that continue to buy Russian oil of "earning their money in other people\'s blood".',
        ),
        SizedBox(height: 14),
        Text(
          'In an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.',
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(0, -0.5),
            blurRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.pink),
                SizedBox(width: 4),
                Text("24.5K", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                Icon(Icons.message_outlined),
                SizedBox(width: 4),
                Text("1K", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Icon(Icons.bookmark, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}

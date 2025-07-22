import 'package:flutter/material.dart';
import 'package:news_app/screens/notification/widget/notification_date_bar.dart';
import 'package:news_app/screens/notification/widget/notification_descriptive.dart';
import 'package:news_app/screens/notification/widget/notification_following.dart';
import 'package:news_app/screens/notification/widget/notification_header.dart';
import 'package:news_app/widgets/bottom_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NotificationHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NotificationDateBar(date: "Today, 22 July"),
                      NotificationDescriptive(
                        imageUrl:
                            'https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png',
                        accountName: 'BBC News',
                        description:
                            "has posted new europe news Ukraine's President Sosuke Aizen has taken the kingdom of Hueco Mundo. Can the Shinigami fetch it back?",
                        time: "14m ago",
                      ),
                      NotificationFollowing(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfthYHT8S4PFFgUONUki1todNQ0BvJ_RTZTQ&s',
                        accountName: "Modelyn Saris",
                        isFollowed: false,
                        time: "1h ago",
                      ),
                      NotificationDescriptive(
                        imageUrl:
                            'https://i.pinimg.com/564x/69/08/45/690845dbe2f12d979b18b192d3217f81.jpg',
                        accountName: 'Omar Meditz',
                        description:
                            "has posted new europe news Ukraine's President Sosuke Aizen has taken the kingdom of Hueco Mundo. Can the Shinigami fetch it back?",
                        time: "2h ago",
                      ),
                      NotificationDateBar(date: "Yesterday, 21 July"),

                      NotificationFollowing(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTey3f0bdDgw6ZnNu96Kce7ck_TFR1zoryH7w&s',
                        accountName: "Marley Botosh",
                        isFollowed: false,
                        time: "1 Day ago",
                      ),
                      NotificationDescriptive(
                        imageUrl:
                            'https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg',
                        accountName: 'Chuuya',
                        description:
                            "liked your post on 'Am I the greatest News Writer?' 😁",
                        time: "14m ago",
                      ),
                      NotificationDescriptive(
                        imageUrl:
                            'https://i.pinimg.com/564x/69/08/45/690845dbe2f12d979b18b192d3217f81.jpg',
                        accountName: 'Omar Meditz',
                        description:
                            "has posted new europe news Ukraine's President Sosuke Aizen has taken the kingdom of Hueco Mundo. Can the Shinigami fetch it back?",
                        time: "1 Day ago",
                      ),
                      NotificationDescriptive(
                        imageUrl:
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/CNN_International_logo.svg/1200px-CNN_International_logo.svg.png',
                        accountName: 'CNN',
                        description:
                            "has posted new europe news 'Her train broke down on her wedding, Can she make it to the wedding place?'",
                        time: "1 Day ago",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomBar(selectedIcon: "home"),
          ],
        ),
      ),
    );
  }
}

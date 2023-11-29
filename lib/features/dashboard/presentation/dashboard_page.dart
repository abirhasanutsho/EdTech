import 'package:edtech/features/dashboard/data/models/courses_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constance/utils.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset("assets/icons/menu.svg"),
                Image.asset("assets/images/user.png"),
              ],
            ),
            SizedBox(height: 30),
            Text("Hey Abir,", style: kHeadingextStyle),
            Text("Find a course you want to learn", style: kSubheadingextStyle),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/search.svg"),
                  SizedBox(width: 16),
                  const Text(
                    "Search for your courses",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA0A5BD),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: index.isEven ? 200 : 240,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZHBw-ETzyf_Hn7VPpCRYcE2VYdHgjum5l-xfVJQJcl1ARAtLdPqzqCKJHy4eiuttvprY&usqp=CAU",
                                fit: BoxFit.fill,
                                height: 140,
                              ),),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}

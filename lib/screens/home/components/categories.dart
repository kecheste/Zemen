import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Houses.svg", "text": "Houses"},
      {"icon": "assets/icons/Cars.svg", "text": "Cars"},
      {"icon": "assets/icons/Others.svg", "text": "Others"},
      {"icon": "assets/icons/Jobs.svg", "text": "Jobs"},
      {"icon": "assets/icons/Sponsored.svg", "text": "Sponsored"},
      {"icon": "assets/icons/Services.svg", "text": "Services"},
      {"icon": "assets/icons/Wanted.svg", "text": "Wanted"},
      {"icon": "assets/icons/Lost.svg", "text": "Lost/Found"},
      {"icon": "assets/icons/Gift.svg", "text": "Free"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 65,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, index) {
              return CategoryCard(
                icon: categories[index]["icon"],
                text: categories[index]["text"],
                press: () {},
              );
            }),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 241, 241),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                icon,
                height: 30,
                width: 30,
              ),
            ),
            const SizedBox(height: 4),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

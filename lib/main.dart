import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleUI();
  }
}

class SimpleUI extends StatelessWidget {
  const SimpleUI({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = "Flutter layout demo";
    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: const SingleChildScrollView(
              child: Column(
            children: [
              ImageSection(image: 'images/lake.jpg'),
              TitleSection(
                  name: "Nguyen Thi Thanh Huong",
                  location: "Ho chi Minh, Viet Nam"),
              ButtonSection(),
              TextSection(
                  description:
                      'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                      'Bernese Alps. Situated 1,578 meters above sea level, it '
                      'is one of the larger Alpine Lakes. A gondola ride from '
                      'Kandersteg, followed by a half-hour walk through pastures '
                      'and pine forest, leads you to the lake, which warms to 20 '
                      'degrees Celsius in the summer. Activities enjoyed here '
                      'include rowing, and riding the summer toboggan run.'),
            ],
          )),
        ));
  }
}

class TitleSection extends StatelessWidget {
  final String name;
  final String location;

  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
              Text(
                location,
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          // Icon(Icons.star, color: Colors.red[500]),
          // const Text('41')
          const FavoriteWidget()
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWithText(color: color, icon: Icons.call, label: "CALL"),
        ButtonWithText(color: color, icon: Icons.near_me, label: "ROUTE"),
        ButtonWithText(color: color, icon: Icons.share, label: "SHARE")
      ],
    );
  }
}

class ButtonWithText extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;

  const ButtonWithText(
      {super.key,
      required this.color,
      required this.icon,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: color),
            ))
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  final String description;

  const TextSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          description,
          softWrap: true,
        ));
  }
}

class ImageSection extends StatelessWidget {
  final String image;

  const ImageSection({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
              onPressed: _toggleFavorite,
              icon: (_isFavorited
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border))),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}

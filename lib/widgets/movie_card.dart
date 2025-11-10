import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  MovieCard({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final isNetworkImage = imagePath.startsWith('http');

    return Container(
      margin: EdgeInsets.all(12),
      height: 200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: isNetworkImage
                    ? NetworkImage(imagePath)
                    : AssetImage(imagePath) as ImageProvider,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.black54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text(description, style: TextStyle(color: Colors.white70)),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Ver")),
                      SizedBox(width: 8),
                      OutlinedButton(onPressed: () {}, child: Text("Guardar")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
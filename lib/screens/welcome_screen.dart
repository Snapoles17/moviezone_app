import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,git
      body: SafeArea(
        child: Column(
          children: [
            // Imagen superior
            Container(
              height: 280,
              width: double.infinity,
              child: Image.asset(
                'assets/movie_background.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // Espacio y logo
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/film_icon.png',
                  width: 50,
                  color: Colors.redAccent,
                ),
                SizedBox(width: 12),
                Text(
                  "MOVIEZONE",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),

            // Botón "Comencemos"
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/'); // ← Navega al login
                },
                child: Text("Comencemos"),
              ),
            ),
            SizedBox(height: 20),

            // Enlace a registro
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register'); // ← Navega al registro
              },
              child: Text(
                "¿Aún no tienes cuenta?\nRegístrate aquí.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Espacio inferior
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
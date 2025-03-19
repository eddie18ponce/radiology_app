import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Radiología Interactiva')),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Imagen de fondo
            Image.asset(
              'assets/skull2.jpg',
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.8,
            ),
            
            // Botones transparentes sobre la imagen
            Positioned(
              top: 20, // Ajusta estas posiciones según tu imagen
              child: InkWell(
                onTap: () => _openDetailScreen(context, 'Cabeza'),
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Cabeza',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            Positioned(
              top: 120, // Ajusta según necesites
              child: InkWell(
                onTap: () => _openDetailScreen(context, 'Torax'),
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Torax',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 140, // Ajusta según necesites
              left: 90,
              child: InkWell(
                onTap: () => _openDetailScreen(context, 'Miembros Superiores'),
                child: Container(
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Miembros Superiores',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 420, // Ajusta según necesites
              right: 115,
              child: InkWell(
                onTap: () => _openDetailScreen(context, 'Miembros Inferiores'),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Miembros Inferiores',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 90, // Ajusta según necesites
              child: InkWell(
                onTap: () => _openDetailScreen(context, 'Columna'),
                child: Container(
                  width: 70,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Columna',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 190, // Ajusta según necesites
              child: InkWell(
                onTap: () => _openDetailScreen(context, 'Abdomen'),
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Abdomen',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            Positioned(
              top: 235, // Ajusta según necesites
              child: InkWell(
                onTap: () => _openDetailScreen(context, 'Pelvis'),
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Pelvis',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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

  void _openDetailScreen(BuildContext context, String region) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(region: region)),
    );
  }
} 
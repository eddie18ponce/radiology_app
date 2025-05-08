import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';
import 'search_helper.dart';

// Mover el mapa patologiasPorRegion fuera de las clases, al inicio del archivo
final Map<String, List<Map<String, String>>> patologiasPorRegion = {
  'Cráneo_AP': [
    {
      'nombre': 'Fractura Lineal',
      'descripcion': 'Línea radiolúcida que atraviesa el hueso craneal',
      'imagePath': 'assets/images/patologias/craneo/fractura_lineal.jpg'
    },
    {
      'nombre': 'Calcificación Intracraneal',
      'descripcion': 'Densidad aumentada focal dentro del parénquima cerebral',
      'imagePath': 'assets/images/patologias/craneo/calcificacion.jpg'
    },
  ],
  'Columna Cervical_Lateral': [
    {
      'nombre': 'Espondilosis Cervical',
      'descripcion': 'Degeneración de los discos cervicales con osteofitos',
      'imagePath': 'assets/images/patologias/columna/espondilosis.jpg'
    },
    {
      'nombre': 'Rectificación Cervical',
      'descripcion': 'Pérdida de la lordosis cervical normal',
      'imagePath': 'assets/images/patologias/columna/rectificacion.jpg'
    },
  ],
  // ... resto de las patologías ...
};

class DetailScreen extends StatefulWidget {
  final String region;

  DetailScreen({required this.region});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late PageController _pageController;
  double currentPage = 0;

  // Mapa de subregiones por región
  static final Map<String, List<String>> subregiones = {
    'Columna': ['Columna Cervical', 'Columna Torácica', 'Columna Lumbar'],
    'Miembros Superiores': ['Hombro', 'Humero', 'Codo', 'Muñeca', 'Mano'],
    'Miembros Inferiores': ['Cadera', 'Fémur', 'Rodilla', 'Tibia', 'Tobillo', 'Pie'],
    'Cabeza': ['Cráneo', 'Senos Paranasales', 'Órbitas', 'ATM'],
    'Torax': ['Parrilla Costal', 'Tórax Óseo', 'Pulmones'],
    'Abdomen': ['Abdomen Simple','Abdomen decubito lateral con rayo tangencial', 'Esogafograma', 'Serie Gastroduodenal', 'Tránsito Intestinal', 'Colon por Enema'],
    'Pelvis': ['Pelvis Ósea', 'Histerosalpingografía'],
  };

  // Mapa de proyecciones por subregión
  static final Map<String, List<String>> proyecciones = {
    'Columna Cervical': ['AP', 'Lateral', 'Oblicuas', 'Dinámicas', 'Odontoides'],
    'Columna Torácica': ['AP', 'Lateral', 'Oblicuas', 'Dinámicas'],
    'Columna Lumbar': ['AP', 'Lateral', 'Oblicuas', 'Dinámicas', 'L5-S1'],
    'Cráneo': ['AP', 'PA', 'Lateral', 'Towne', 'Caldwell'],
    'Senos Paranasales': ['Caldwell', 'Waters', 'Hirtz', 'Lateral'],
    'Órbitas': ['AP', 'Lateral', 'Rhese'],
    'OPG': ['cefalometria', 'ATM','Panorámica'],
    'Parrilla Costal': ['AP', 'PA', 'Oblicuas'],
    'Tórax Óseo': ['AP', 'PA', 'Lateral', 'Oblicuas'],
    'Pulmones': ['AP', 'PA', 'Lateral', 'Decúbito'],
    'Abdomen Simple': ['AP', 'PA', 'Lateral', 'Decúbito'],
    'Esogafograma': ['AP', 'PA', 'Lateral', 'Decúbito'],
    'Serie Gastroduodenal': ['AP', 'PA', 'Lateral', 'Decúbito'],
    'Tránsito Intestinal': ['AP', 'PA', 'Lateral', 'Decúbito'],
    'Colon por Enema': ['AP', 'PA', 'Lateral', 'Decúbito'],
    'CUMS': ['AP', 'Lateral', 'Decúbito'],
    'Pelvis Ósea': ['AP', 'Inlet', 'Outlet', 'Rana', 'Falso Perfil', 'Dunn'],
    'Histerosalpingografía': ['AP', 'Lateral', 'Oblicuas'],
    'Hombro': ['AP', 'Axial', 'Y de Escápula', 'Transtorácica'],
    'Humero': ['AP', 'Lateral'],
    'Codo': ['AP', 'Lateral', 'Oblicuas'],
    'Muñeca': ['PA', 'Lateral', 'Oblicua', 'Escafoides'],
    'Mano': ['PA', 'Oblicua', 'Lateral', 'Túnel Carpiano'],
    'Fémur': ['AP', 'Lateral'],
    'Rodilla': ['AP', 'Lateral', 'Axial de Rótula', 'Túnel'],
    'Tibia': ['AP', 'Lateral'],
    'Tobillo': ['AP', 'Lateral', 'Mortaja'],
    'Pie': ['AP', 'Oblicua', 'Lateral', 'Calcáneo Axial'],
  };

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: 0,
    );
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Regiones de ${widget.region}',
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: CupertinoColors.white,
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: subregiones[widget.region]?.map((subregion) {
                return Container(
                  width: 160,
                  height: 160,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => SubregionScreen(
                            region: widget.region,
                            subregion: subregion,
                            proyecciones: proyecciones[subregion] ?? [],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: CupertinoColors.systemGrey4,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.systemGrey4.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _getIconForSubregion(subregion),
                              color: CupertinoColors.systemBlue,
                              size: 40,
                            ),
                            SizedBox(height: 12),
                            Text(
                              subregion,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: CupertinoColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })?.toList() ?? [],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconForSubregion(String subregion) {
    if (subregion.contains('Columna')) return CupertinoIcons.arrow_up_arrow_down;
    if (subregion.contains('Cráneo')) return CupertinoIcons.heart;
    if (subregion.contains('Torax')) return CupertinoIcons.person;
    if (subregion.contains('Abdomen')) return CupertinoIcons.person_2;
    if (subregion.contains('Pulmones')) return CupertinoIcons.airplane;
    if (subregion.contains('Miembros')) return CupertinoIcons.hand_raised;
    if (subregion.contains('Senos')) return CupertinoIcons.person_crop_circle;
    if (subregion.contains('Órbitas')) return CupertinoIcons.eye;
    if (subregion.contains('ATM')) return CupertinoIcons.chat_bubble_2;
    if (subregion.contains('Parrilla')) return CupertinoIcons.rectangle_grid_2x2;
    if (subregion.contains('Tórax')) return CupertinoIcons.rectangle_stack;
    if (subregion.contains('Abdomen')) return CupertinoIcons.square_stack_3d_up;
    if (subregion.contains('Pelvis')) return CupertinoIcons.person_2_fill;
    return CupertinoIcons.circle;
  }

  String _getImageForSubregion(String subregion) {
    try {
      return 'assets/images/patologias/craneo/fractura_lineal.jpg';
    } catch (e) {
      return 'assets/images/patologias/craneo/fractura_lineal.jpg'; // Imagen por defecto si hay error
    }
  }
}

class SubregionScreen extends StatelessWidget {
  final String region;
  final String subregion;
  final List<String> proyecciones;

  SubregionScreen({
    required this.region,
    required this.subregion,
    required this.proyecciones,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          subregion,
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: CupertinoColors.white,
      ),
      child: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: proyecciones.length,
          itemBuilder: (context, index) {
            final proyeccion = proyecciones[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ProyeccionDetailScreen(
                        region: region,
                        subregion: subregion,
                        proyeccion: proyeccion,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: CupertinoColors.systemGrey4,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.photo,
                          color: CupertinoColors.systemBlue,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            proyeccion,
                            style: TextStyle(
                              color: CupertinoColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Icon(
                          CupertinoIcons.chevron_right,
                          color: CupertinoColors.systemGrey,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProyeccionDetailScreen extends StatelessWidget {
  final String region;
  final String subregion;
  final String proyeccion;

  ProyeccionDetailScreen({
    required this.region,
    required this.subregion,
    required this.proyeccion,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          proyeccion,
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: CupertinoColors.white,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.photo,
                    size: 48,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Descripción',
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Aquí va la descripción detallada de la proyección...',
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Técnica',
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Aquí va la técnica de realización...',
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
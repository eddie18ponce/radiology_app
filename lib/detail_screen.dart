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
    return Scaffold(
      appBar: AppBar(
        title: Text('Regiones de ${widget.region}'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: subregiones[widget.region]?.map((subregion) {
              return Container(
                width: 160, // Ancho fijo más pequeño
                height: 160, // Altura igual al ancho para hacerlo cuadrado
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubregionScreen(
                            region: widget.region,
                            subregion: subregion,
                            proyecciones: proyecciones[subregion] ?? [],
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Theme.of(context).primaryColor,
                            Theme.of(context).primaryColor.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _getIconForSubregion(subregion),
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(height: 12),
                            Text(
                              subregion,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })?.toList() ?? [],
          ),
        ),
      ),
    );
  }

  IconData _getIconForSubregion(String subregion) {
    if (subregion.contains('Columna')) return Icons.straighten;
    if (subregion.contains('Cráneo')) return Icons.face;
    if (subregion.contains('Torax')) return Icons.air;
    if (subregion.contains('Abdomen')) return Icons.accessibility_new;
    if (subregion.contains('Pulmones')) return Icons.air;
    if (subregion.contains('Miembros')) return Icons.accessibility;
    if (subregion.contains('Senos')) return Icons.face_retouching_natural;
    if (subregion.contains('Órbitas')) return Icons.remove_red_eye;
    return Icons.medical_services;
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

  IconData _getIconForProyeccion(String proyeccion) {
    switch (proyeccion) {
      case 'AP':
        return Icons.face;
      case 'PA':
        return Icons.face;
      case 'Lateral':
        return Icons.face_outlined;
      case 'Oblicuas':
        return Icons.rotate_right;
      case 'Towne':
        return Icons.face_retouching_natural;
      case 'Caldwell':
        return Icons.face_retouching_natural;
      case 'Watters':
        return Icons.face_outlined;
      case 'Hirtz':
        return Icons.accessibility;
      default:
        return Icons.radio_button_checked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proyecciones de $subregion'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: proyecciones.map((proyeccion) {
              return Container(
                width: 160,
                height: 160,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProyeccionDetailScreen(
                            region: region,
                            subregion: subregion,
                            proyeccion: proyeccion,
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Theme.of(context).primaryColor,
                            Theme.of(context).primaryColor.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _getIconForProyeccion(proyeccion),
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(height: 12),
                            Text(
                              proyeccion,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('$proyeccion - $subregion'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Sección de Anatomía Radiológica
              Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Anatomía Radiológica',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 250,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image_outlined, size: 50, color: Colors.grey[400]),
                            SizedBox(height: 8),
                            Text(
                              'Imagen anatómica pendiente',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),

              // Sección de Descripción Técnica
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).primaryColor.withOpacity(0.8),
                        Theme.of(context).primaryColor.withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.description, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'Descripción Técnica',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                _mostrarImagenProyeccion(context);
                              },
                              icon: Icon(Icons.image, color: Colors.white),
                              label: Text('Ver proyección'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white24,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        _buildTechnicalDetail(
                          'Posición del paciente:',
                          'Paciente de pie o sentado, hombro en posición neutra',
                        ),
                        SizedBox(height: 12),
                        _buildTechnicalDetail(
                          'Rayo central:',
                          'Perpendicular al receptor de imagen, dirigido al centro de la articulación glenohumeral',
                        ),
                        SizedBox(height: 12),
                        _buildTechnicalDetail(
                          'Estructuras visualizadas:',
                          'Articulación glenohumeral, acromion, clavícula lateral, cabeza humeral, cuello quirúrgico',
                        ),
                        SizedBox(height: 12),
                        _buildTechnicalDetail(
                          'Criterios de calidad:',
                          'Articulación glenohumeral centrada, espacio articular visible, sin rotación',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              _buildPatologiasSection(context),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTechnicalDetail(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        SizedBox(height: 4),
        Text(
          content,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white.withOpacity(0.8),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildPatologiasSection(BuildContext context) {
    // Crear una clave única para buscar las patologías específicas
    String clave = '${subregion}_$proyeccion';
    List<Map<String, String>> patologias = patologiasPorRegion[clave] ?? [];

    if (patologias.isEmpty) {
      return Card(
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.medical_services, color: Theme.of(context).primaryColor),
                  SizedBox(width: 8),
                  Text(
                    'Patologías Frecuentes',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text('No hay patologías específicas registradas para esta proyección.'),
            ],
          ),
        ),
      );
    }

    return Card(
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.medical_services, color: Theme.of(context).primaryColor),
                SizedBox(width: 8),
                Text(
                  'Patologías Frecuentes en $proyeccion',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            ...patologias.map((patologia) => _buildPatologiaItem(
              context,
              patologia['nombre'] ?? '',
              patologia['descripcion'] ?? '',
              patologia['imagePath'] ?? '',
            )).toList(),
            ListTile(
              title: Text('EPOC'),
              subtitle: Text('Enfermedad Pulmonar Obstructiva Crónica'),
              trailing: IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () async {
                  const url = 'https://www.scielo.org.mx/scielo.php?script=sci_arttext&pid=S0026-17422020000300028';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatologiaItem(BuildContext context, String titulo, String descripcion, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _mostrarImagenPatologia(context, titulo, imagePath);
                },
                icon: Icon(Icons.image, size: 18),
                label: Text('Ver imagen'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            descripcion,
            style: TextStyle(fontSize: 14.0),
          ),
          Divider(),
        ],
      ),
    );
  }

  void _mostrarImagenPatologia(BuildContext context, String titulo, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          titulo,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(16),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Imagen anatómica
                            Center(
                              child: RadiologiaHelper.obtenerImagenAnatomia(titulo) != null
                                  ? Image.asset(
                                      RadiologiaHelper.obtenerImagenAnatomia(titulo)!,
                                      fit: BoxFit.contain,
                                    )
                                  : Text('Imagen anatómica pendiente'),
                            ),
                            SizedBox(height: 16),
                            
                            // Descripción técnica
                            Text(
                              'Descripción Técnica',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Builder(
                              builder: (context) {
                                final descripcionTecnica = 
                                    RadiologiaHelper.obtenerDescripcionTecnica(titulo);
                                if (descripcionTecnica != null) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Posición del paciente: ${descripcionTecnica['posicion_paciente'] ?? 'No especificado'}'),
                                      Text('Rayo central: ${descripcionTecnica['rayo_central'] ?? 'No especificado'}'),
                                      Text('Estructuras visualizadas: ${descripcionTecnica['estructuras_visualizadas'] ?? 'No especificado'}'),
                                      Text('Criterios de calidad: ${descripcionTecnica['criterios_calidad'] ?? 'No especificado'}'),
                                    ],
                                  );
                                } else {
                                  return Text('Descripción técnica no disponible');
                                }
                              },
                            ),
                            SizedBox(height: 16),
                            
                            // Link de patología
                            if (RadiologiaHelper.guiaRadiologica[titulo]?['link_patologia']?.isNotEmpty ?? false)
                              InkWell(
                                onTap: () async {
                                  final url = RadiologiaHelper.guiaRadiologica[titulo]!['link_patologia'];
                                  if (await canLaunch(url!)) {
                                    await launch(url);
                                  }
                                },
                                child: Text(
                                  'Ver más información sobre la patología',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _mostrarImagenProyeccion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Proyección $proyeccion de $subregion',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: FutureBuilder(
                        // Aquí irá la lógica para cargar la imagen desde la base de datos
                        future: Future.delayed(Duration(seconds: 1)), // Placeholder
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator(color: Colors.white);
                          }
                          // Aquí se mostrará la imagen cargada desde la base de datos
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 64,
                                color: Colors.white54,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Imagen de proyección pendiente',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 
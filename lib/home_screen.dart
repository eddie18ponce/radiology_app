import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'search_helper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radiología Interactiva'),
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar por diagnóstico (ej: EPOC, fractura...)',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                filled: true,
                fillColor: Colors.black26,
              ),
              onChanged: (value) {
                if (value.length > 2) {
                  _mostrarSugerencias(context, value);
                }
              },
            ),
          ),
          // Imagen principal y botones
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  'assets/skull2.jpg',
                  fit: BoxFit.contain,
                ),
                // Botones sobre la imagen
                Positioned(
                  top: 20,
                  left: 145,
                  child: _buildAnatomyButton(
                    context,
                    'Cabeza',
                    Icons.face,
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 145,
                  child: _buildAnatomyButton(
                    context,
                    'Columna',
                    Icons.straighten,
                  ),
                ),
                Positioned(
                  top: 140,
                  right: 170,
                  child: _buildAnatomyButton(
                    context,
                    'Torax',
                    Icons.accessibility,
                  ),
                ),
                Positioned(
                  top: 190,
                  left: 155,
                  child: _buildAnatomyButton(
                    context,
                    'Abdomen',
                    Icons.accessibility_new,
                  ),
                ),
                Positioned(
                  top: 260,
                  right: 260,
                  child: _buildAnatomyButton(
                    context,
                    'Miembros Superiores',
                    Icons.accessibility,
                  ),
                ),
                Positioned(
                  top: 450,
                  right: 50,
                  child: _buildAnatomyButton(
                    context,
                    'Miembros Inferiores',
                    Icons.accessibility,
                  ),
                ),
                Positioned(
                  top: 230,
                  left: 155,
                  child: _buildAnatomyButton(
                    context,
                    'Pelvis',
                    Icons.accessibility_new,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openDetailScreen(BuildContext context, String region) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(region: region)),
    );
  }

  void _mostrarSugerencias(BuildContext context, String query) {
    List<String> sugerencias = RadiologiaHelper.buscarSugerencias(query);
    
    if (sugerencias.isEmpty) return;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Diagnósticos encontrados',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: sugerencias.length,
                    itemBuilder: (context, index) {
                      final diagnostico = sugerencias[index];
                      final recomendacion = RadiologiaHelper.guiaRadiologica[diagnostico];
                      
                      return ListTile(
                        title: Text(diagnostico),
                        subtitle: Text(
                          '${recomendacion?['estudio']} - ${recomendacion?['proyeccion']}',
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.pop(context); // Cierra el diálogo
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProyeccionDetailScreen(
                                  region: recomendacion?['region'] ?? '',
                                  subregion: recomendacion?['subregion'] ?? '',
                                  proyeccion: recomendacion?['proyeccion'] ?? '',
                                ),
                              ),
                            );
                          },
                        ),
                        onTap: () {
                          // Muestra un diálogo con más detalles
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(diagnostico),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Estudio: ${recomendacion?['estudio']}'),
                                    Text('Región: ${recomendacion?['region']}'),
                                    Text('Proyección: ${recomendacion?['proyeccion']}'),
                                    Text('Descripción: ${recomendacion?['descripcion']}'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Cancelar'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Cierra el diálogo de detalles
                                      Navigator.pop(context); // Cierra el diálogo de sugerencias
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProyeccionDetailScreen(
                                            region: recomendacion?['region'] ?? '',
                                            subregion: recomendacion?['subregion'] ?? '',
                                            proyeccion: recomendacion?['proyeccion'] ?? '',
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('Ver proyección'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnatomyButton(BuildContext context, String title, IconData icon) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.white),
      label: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(region: title),
          ),
        );
      },
    );
  }
}

class AnimatedHelpButton extends StatefulWidget {
  final VoidCallback onPressed;

  AnimatedHelpButton({required this.onPressed});

  @override
  _AnimatedHelpButtonState createState() => _AnimatedHelpButtonState();
}

class _AnimatedHelpButtonState extends State<AnimatedHelpButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: IconButton(
          icon: Stack(
            children: [
              Icon(
                Icons.help_outline,
                color: Colors.white,
                size: 30,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 8,
                    minHeight: 8,
                  ),
                ),
              ),
            ],
          ),
          onPressed: widget.onPressed,
          tooltip: '¿Necesitas ayuda?',
        ),
      ),
    );
  }
}

class AsistenteDialog extends StatefulWidget {
  @override
  _AsistenteDialogState createState() => _AsistenteDialogState();
}

class _AsistenteDialogState extends State<AsistenteDialog> {
  final TextEditingController _consultaController = TextEditingController();
  String? _resultado;
  List<String> _sugerencias = [];
  int _expandedIndex = -1;

  void _buscarProyeccion(String consulta) {
    consulta = consulta.toLowerCase();
    final resultado = RadiologiaHelper.guiaRadiologica[consulta];

    if (resultado != null) {
      setState(() {
        _resultado = 'Para ${consulta} se recomienda:\n'
            'Proyección: ${resultado['proyeccion']}\n'
            'En la región: ${resultado['region']}\n'
            'Subregión: ${resultado['subregion']}';
      });

      // Opcional: navegar automáticamente a la proyección
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop();
        _navegarAProyeccion(context, resultado);
      });
    } else {
      setState(() {
        _resultado = 'No encontré una proyección específica para esa consulta.\n'
            'Prueba con términos más específicos o consulta el menú principal.';
      });
    }
  }

  void _navegarAProyeccion(BuildContext context, Map<String, dynamic> info) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text('¿Qué deseas ver?'),
          content: Container(
            width: double.minPositive,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.image, color: Theme.of(context).primaryColor),
                  title: Text('Ver proyección radiológica'),
                  subtitle: Text('Anatomía y posicionamiento'),
                  onTap: () {
                    Navigator.of(context).pop(); // Cerrar el diálogo actual
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(region: info['region'] as String),
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.picture_as_pdf, color: Colors.red),
                  title: Text('Información médica'),
                  subtitle: Text('Guía clínica de la patología'),
                  onTap: () {
                    Navigator.of(context).pop(); // Cerrar el diálogo actual
                    // Aquí irá la navegación al PDF cuando esté implementado
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Próximamente: Información médica en PDF'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '¿Qué patología necesitas estudiar?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _consultaController,
              decoration: InputDecoration(
                hintText: 'Ej: fractura de clavícula, sinusitis...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _sugerencias = RadiologiaHelper.buscarSugerencias(value);
                });
              },
            ),
            if (_sugerencias.isNotEmpty)
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: _sugerencias.length,
                  itemBuilder: (context, index) {
                    final patologia = _sugerencias[index];
                    final info = RadiologiaHelper.guiaRadiologica[patologia]!;
                    return ListTile(
                      title: Text(patologia.toUpperCase()),
                      subtitle: Text(info['descripcion']),
                      trailing: Text(info['proyeccion']),
                      onTap: () => _navegarAProyeccion(context, info),
                    );
                  },
                ),
              ),
            TextButton(
              onPressed: () {
                _mostrarCategoriasPatologias(context);
              },
              child: Text('Ver todas las categorías'),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarCategoriasPatologias(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Categorías de Patologías',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Flexible(
                      child: SingleChildScrollView(
                        child: ExpansionPanelList(
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              _expandedIndex = isExpanded ? index : -1;
                            });
                          },
                          children: RadiologiaHelper.categoriasPatologias.entries
                              .toList()
                              .asMap()
                              .entries
                              .map((entry) {
                            int idx = entry.key;
                            var categoria = entry.value;
                            return ExpansionPanel(
                              isExpanded: _expandedIndex == idx,
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  title: Text(categoria.key),
                                );
                              },
                              body: Column(
                                children: categoria.value.map((patologia) {
                                  return ListTile(
                                    title: Text(patologia),
                                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                                    onTap: () {
                                      final info = RadiologiaHelper.guiaRadiologica[
                                          patologia.toLowerCase()];
                                      if (info != null) {
                                        _navegarAProyeccion(context, info);
                                      }
                                    },
                                  );
                                }).toList(),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

Widget _buildButton(String text, Color color) {
  return Container(
    width: 100,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.blue.withOpacity(0.3),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.blue.withOpacity(0.5),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 3,
              color: Colors.black54,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
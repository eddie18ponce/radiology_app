import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'search_helper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Radiología Interactiva',
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: CupertinoColors.white,
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Barra de búsqueda
            Padding(
              padding: EdgeInsets.all(16),
              child: CupertinoSearchTextField(
                placeholder: 'Buscar por diagnóstico (ej: EPOC, fractura...)',
                onChanged: (value) {
                  if (value.length > 2) {
                    _mostrarSugerencias(context, value);
                  }
                },
                backgroundColor: CupertinoColors.systemGrey6,
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
                    left: 175,
                    child: _buildAnatomyButton(
                      context,
                      'Cabeza',
                      CupertinoIcons.heart,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 175,
                    child: _buildAnatomyButton(
                      context,
                      'Columna',
                      CupertinoIcons.arrow_up_arrow_down,
                    ),
                  ),
                  Positioned(
                    top: 145,
                    right: 175,
                    child: _buildAnatomyButton(
                      context,
                      'Torax',
                      CupertinoIcons.person,
                    ),
                  ),
                  Positioned(
                    top: 198,
                    left: 165,
                    child: _buildAnatomyButton(
                      context,
                      'Abdomen',
                      CupertinoIcons.person_2,
                    ),
                  ),
                  Positioned(
                    top: 250,
                    right: 260,
                    child: _buildAnatomyButton(
                      context,
                      'Miembros Superiores',
                      CupertinoIcons.hand_raised,
                    ),
                  ),
                  Positioned(
                    top: 450,
                    right: 175,
                    child: _buildAnatomyButton(
                      context,
                      'Miembros Inferiores',
                      CupertinoIcons.arrow_down,
                    ),
                  ),
                  Positioned(
                    top: 235,
                    left: 175,
                    child: _buildAnatomyButton(
                      context,
                      'Pelvis',
                      CupertinoIcons.person_2_fill,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnatomyButton(BuildContext context, String text, IconData icon) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => _openDetailScreen(context, text),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 7),
        decoration: BoxDecoration(
          color: CupertinoColors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: CupertinoColors.systemGrey4,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 25,
              height: 15,
              child: Image.asset(
                _getImageForRegion(text),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: CupertinoColors.black,
                fontSize: 8,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getImageForRegion(String region) {
    switch (region) {
      case 'Cabeza':
        return 'assets/images/anatomy/skull.png';
      case 'Columna':
        return 'assets/images/anatomy/spine.png';
      case 'Torax':
        return 'assets/images/anatomy/chest.png';
      case 'Abdomen':
        return 'assets/images/anatomy/abdomen.png';
      case 'Miembros Superiores':
        return 'assets/images/anatomy/upper_limbs.png';
      case 'Miembros Inferiores':
        return 'assets/images/anatomy/lower_limbs.png';
      case 'Pelvis':
        return 'assets/images/anatomy/pelvis.png';
      default:
        return 'assets/images/anatomy/default.png';
    }
  }

  void _openDetailScreen(BuildContext context, String region) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => DetailScreen(region: region),
      ),
    );
  }

  void _mostrarSugerencias(BuildContext context, String query) {
    List<String> sugerencias = RadiologiaHelper.buscarSugerencias(query);
    
    if (sugerencias.isEmpty) return;

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.systemGrey5,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Diagnósticos encontrados',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.black,
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Text('Cerrar'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: sugerencias.length,
                  itemBuilder: (context, index) {
                    final diagnostico = sugerencias[index];
                    final recomendacion = RadiologiaHelper.guiaRadiologica[diagnostico];
                    
                    return CupertinoListTile(
                      title: Text(
                        diagnostico,
                        style: TextStyle(
                          color: CupertinoColors.black,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        '${recomendacion?['estudio']} - ${recomendacion?['proyeccion']}',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey,
                          fontSize: 14,
                        ),
                      ),
                      trailing: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(
                          CupertinoIcons.chevron_right,
                          color: CupertinoColors.systemGrey,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
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
                        showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
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
                                CupertinoDialogAction(
                                  child: Text('Cancelar'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                CupertinoDialogAction(
                                  child: Text('Ver detalles'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => ProyeccionDetailScreen(
                                          region: recomendacion?['region'] ?? '',
                                          subregion: recomendacion?['subregion'] ?? '',
                                          proyeccion: recomendacion?['proyeccion'] ?? '',
                                        ),
                                      ),
                                    );
                                  },
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
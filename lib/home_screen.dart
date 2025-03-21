import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'search_helper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radiología Interactiva'),
        actions: [
          AnimatedHelpButton(
            onPressed: () => _mostrarAsistente(context),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Imagen de fondo
                        Image.asset(
                          'assets/skull2.jpg',
                          fit: BoxFit.contain,
                          height: constraints.maxHeight * 0.8,
                        ),
                        
                        // Botones con sus posiciones originales
                        Positioned(
                          top: 90,
                          child: InkWell(
                            onTap: () => _openDetailScreen(context, 'Cabeza'),
                            child: _buildButton('Cabeza', Colors.blue),
                          ),
                        ),
                        
                        Positioned(
                          top: 200,
                          child: InkWell(
                            onTap: () => _openDetailScreen(context, 'Torax'),
                            child: _buildButton('Torax', Colors.blue),
                          ),
                        ),

                        Positioned(
                          top: 270,
                          left: 30,
                          child: InkWell(
                            onTap: () => _openDetailScreen(context, 'Miembros Superiores'),
                            child: _buildButton('Miembros Superiores', Colors.blue),
                          ),
                        ),

                        Positioned(
                          top: 450,
                          right: 80,
                          child: InkWell(
                            onTap: () => _openDetailScreen(context, 'Miembros Inferiores'),
                            child: _buildButton('Miembros Inferiores', Colors.blue),
                          ),
                        ),

                        Positioned(
                          top: 140,
                          child: InkWell(
                            onTap: () => _openDetailScreen(context, 'Columna'),
                            child: _buildButton('Columna', Colors.blue),
                          ),
                        ),

                        Positioned(
                          top: 250,
                          child: InkWell(
                            onTap: () => _openDetailScreen(context, 'Abdomen'),
                            child: _buildButton('Abdomen', Colors.blue),
                          ),
                        ),
                        
                        Positioned(
                          top: 300,
                          child: InkWell(
                            onTap: () => _openDetailScreen(context, 'Pelvis'),
                            child: _buildButton('Pelvis', Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _openDetailScreen(BuildContext context, String region) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(region: region)),
    );
  }

  void _mostrarAsistente(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AsistenteDialog();
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(region: info['region'] as String),
      ),
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
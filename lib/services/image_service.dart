import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ImageService {
  static Future<String> getImagePath(String region, String tipo, String proyeccion) async {
    // Primero intenta cargar localmente
    String localPath = 'assets/images/$tipo/$region/$proyeccion.jpg';
    
    // Si no existe localmente y hay internet, carga de la nube
    if (!await assetExists(localPath) && await hasInternet()) {
      return await downloadAndCache(region, tipo, proyeccion);
    }
    
    return localPath;
  }

  static Future<bool> assetExists(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> hasInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  static Future<String> downloadAndCache(String region, String tipo, String proyeccion) async {
    try {
      // URL base para las imágenes (esto debería ser configurado según tu backend)
      String baseUrl = 'https://tu-servidor.com/images';
      String imageUrl = '$baseUrl/$tipo/$region/$proyeccion.jpg';

      // Descargar la imagen
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode != 200) {
        throw Exception('Error al descargar la imagen');
      }

      // Obtener el directorio de caché
      final directory = await getApplicationCacheDirectory();
      final String localPath = '${directory.path}/$tipo/$region/$proyeccion.jpg';

      // Crear el directorio si no existe
      await Directory('${directory.path}/$tipo/$region').create(recursive: true);

      // Guardar la imagen
      final file = File(localPath);
      await file.writeAsBytes(response.bodyBytes);

      return localPath;
    } catch (e) {
      // Si hay error, devolver la ruta local por defecto
      return 'assets/images/default.jpg';
    }
  }
} 
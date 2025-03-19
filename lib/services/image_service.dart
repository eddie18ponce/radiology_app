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
} 
class RadiologiaHelper {
  static final Map<String, Map<String, dynamic>> guiaRadiologica = {
    'epoc': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA',
      'descripcion': 'Para evaluar hiperinflación, bullas, y signos de enfisema',
      'imagen_anatomia': 'assets/pa-torax.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'insuficiencia cardiaca': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA',
      'descripcion': 'Para evaluar cardiomegalia y congestión pulmonar',
      'imagen_anatomia': 'assets/craneo-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel del nasion',
        'estructuras_visualizadas': 'Bóveda craneal, base del cráneo, senos paranasales',
        'criterios_calidad': 'Simetría bilateral, visualización completa del cráneo'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'obstruccion intestinal': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Abdomen Simple',
      'proyeccion': 'AP',
      'descripcion': 'Para evaluar niveles hidroaéreos y dilatación de asas',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Intestino, hígado, riñones',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'fractura craneal': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Para identificar líneas de fractura y hundimientos',
      'imagen_anatomia': 'assets/craneo-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel del nasion',
        'estructuras_visualizadas': 'Bóveda craneal, base del cráneo, senos paranasales',
        'criterios_calidad': 'Simetría bilateral, visualización completa del cráneo'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS TRAUMÁTICAS
    'fractura craneal lineal': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Para identificar líneas de fractura simple en la bóveda craneal',
      'imagen_anatomia': 'assets/craneo-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel del nasion',
        'estructuras_visualizadas': 'Bóveda craneal, base del cráneo, senos paranasales',
        'criterios_calidad': 'Simetría bilateral, visualización completa del cráneo'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'fractura craneal conminuta': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'proyeccion': 'AP, Lateral y Towne',
      'descripcion': 'Múltiples fragmentos óseos en zona de fractura',
      'imagen_anatomia': 'assets/craneo-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel del nasion',
        'estructuras_visualizadas': 'Bóveda craneal, base del cráneo, senos paranasales',
        'criterios_calidad': 'Simetría bilateral, visualización completa del cráneo'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'fractura craneal depresiva': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Hundimiento del hueso craneal por trauma',
      'imagen_anatomia': 'assets/craneo-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel del nasion',
        'estructuras_visualizadas': 'Bóveda craneal, base del cráneo, senos paranasales',
        'criterios_calidad': 'Simetría bilateral, visualización completa del cráneo'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'fractura base craneo': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'proyeccion': 'Base y Lateral',
      'descripcion': 'Fracturas en la base del cráneo',
      'imagen_anatomia': 'assets/craneo-base.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Base del cráneo, senos paranasales',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'hematoma epidural': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Sangrado entre el cráneo y la duramadre',
      'imagen_anatomia': 'assets/craneo-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel del nasion',
        'estructuras_visualizadas': 'Bóveda craneal, base del cráneo, senos paranasales',
        'criterios_calidad': 'Simetría bilateral, visualización completa del cráneo'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'fractura orbital': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Órbita',
      'proyeccion': 'Waters y Lateral',
      'descripcion': 'Fracturas en la órbita ocular o piso orbital',
      'imagen_anatomia': 'assets/craneo-waters.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Órbita ocular, piso orbital',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS ÓSEAS
    'enfermedad de paget': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Engrosamiento del cráneo y cambios en la densidad ósea',
      'imagen_anatomia': 'assets/craneo-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel del nasion',
        'estructuras_visualizadas': 'Bóveda craneal, base del cráneo, senos paranasales',
        'criterios_calidad': 'Simetría bilateral, visualización completa del cráneo'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'craneosinostosis': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'proyeccion': 'AP, Lateral y Towne',
      'descripcion': 'Cierre prematuro de suturas craneales',
      'imagen_anatomia': 'assets/craneo-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel del nasion',
        'estructuras_visualizadas': 'Bóveda craneal, base del cráneo, senos paranasales',
        'criterios_calidad': 'Simetría bilateral, visualización completa del cráneo'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'osteomalacia': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Cambios en el grosor y forma del cráneo',
      'imagen_anatomia': 'assets/craneo-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel del nasion',
        'estructuras_visualizadas': 'Bóveda craneal, base del cráneo, senos paranasales',
        'criterios_calidad': 'Simetría bilateral, visualización completa del cráneo'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS DE SENOS PARANASALES
    'sinusitis': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Senos Paranasales',
      'proyeccion': 'Waters y Lateral',
      'descripcion': 'Opacificación de senos paranasales',
      'imagen_anatomia': 'assets/craneo-waters.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Senos paranasales',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'polipos sinusales': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Senos Paranasales',
      'proyeccion': 'Waters',
      'descripcion': 'Masas radioopacas en los senos paranasales',
      'imagen_anatomia': 'assets/craneo-waters.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Senos paranasales',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'mucocele': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Senos Paranasales',
      'proyeccion': 'Waters y Lateral',
      'descripcion': 'Quistes mucosos en senos paranasales',
      'imagen_anatomia': 'assets/craneo-waters.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Senos paranasales',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS DENTALES Y MANDIBULARES
    'absceso dental': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Maxilar',
      'proyeccion': 'Waters y Lateral',
      'descripcion': 'Infección dental con extensión ósea',
      'imagen_anatomia': 'assets/craneo-waters.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Maxilar, senos paranasales',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'osteomielitis mandibular': {
      'estudio': 'Radiografía de Cráneo',
      'region': 'Cabeza',
      'subregion': 'Mandíbula',
      'proyeccion': 'PA y Lateral',
      'descripcion': 'Infección ósea de la mandíbula',
      'imagen_anatomia': 'assets/craneo-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cabeza en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel del nasion',
        'estructuras_visualizadas': 'Mandíbula',
        'criterios_calidad': 'Simetría bilateral, visualización completa de la mandíbula'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS PULMONARES INFECCIOSAS
    'neumonia lobar': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA y Lateral',
      'descripcion': 'Consolidación lobar con broncograma aéreo',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'neumonia intersticial': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA y Lateral',
      'descripcion': 'Patrón reticular o reticulonodular difuso',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'tuberculosis pulmonar': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA y Lateral',
      'descripcion': 'Infiltrados en lóbulos superiores, cavitaciones',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'absceso pulmonar': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA y Lateral',
      'descripcion': 'Cavidad con nivel hidroaéreo',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'empiema pleural': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pleura',
      'proyeccion': 'PA y Lateral',
      'descripcion': 'Colección pleural loculada con nivel hidroaéreo',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS ONCOLÓGICAS
    'cancer pulmonar': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA y Lateral',
      'descripcion': 'Masa pulmonar, adenopatías hiliares',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'metastasis pulmonares': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA',
      'descripcion': 'Nódulos pulmonares múltiples',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'nodulo pulmonar solitario': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA y Lateral',
      'descripcion': 'Lesión redondeada única menor a 3cm',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS OBSTRUCTIVAS Y RESTRICTIVAS
    'enfisema pulmonar': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA y Lateral',
      'descripcion': 'Hiperinsuflación, bullas, aplanamiento diafragmático',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'fibrosis pulmonar': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA y Lateral',
      'descripcion': 'Patrón reticular bilateral, pérdida de volumen',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS VASCULARES Y CARDÍACAS
    'edema pulmonar': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA',
      'descripcion': 'Patrón alveolar perihiliar, líneas B de Kerley',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'tromboembolismo pulmonar': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'proyeccion': 'PA',
      'descripcion': 'Signo de Westermark, joroba de Hampton',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS TRAUMÁTICAS
    'neumotorax': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pleura',
      'proyeccion': 'PA espirado',
      'descripcion': 'Línea pleural visible, ausencia de trama vascular',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'hemotorax': {
      'estudio': 'Radiografía de Tórax',
      'region': 'Torax',
      'subregion': 'Pleura',
      'proyeccion': 'PA y Lateral',
      'descripcion': 'Opacidad homogénea que borra ángulo costofrénico',
      'imagen_anatomia': 'assets/torax-pa.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Bipedestación, tórax pegado al receptor de imagen',
        'rayo_central': 'Perpendicular al receptor a nivel de T7',
        'estructuras_visualizadas': 'Campos pulmonares, silueta cardíaca, diafragma',
        'criterios_calidad': 'Inspiración completa, escápulas fuera de campos pulmonares'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS ABDOMINALES GENERALES
    'ileo mecanico': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Intestino',
      'proyeccion': 'AP y Decúbito',
      'descripcion': 'Niveles hidroaéreos, dilatación de asas intestinales',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Intestino, hígado, riñones',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'ileo paralitico': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Intestino',
      'proyeccion': 'AP',
      'descripcion': 'Distensión difusa de asas intestinales sin niveles',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Intestino',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'volvulo': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Intestino',
      'proyeccion': 'AP y Decúbito',
      'descripcion': 'Signo del grano de café en vólvulo sigmoides',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Intestino',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'neumoperitoneo': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Cavidad Peritoneal',
      'proyeccion': 'AP de pie',
      'descripcion': 'Aire libre subdiafragmático',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Cavidad peritoneal',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'ascitis': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Cavidad Peritoneal',
      'proyeccion': 'AP y Decúbito',
      'descripcion': 'Borramiento de líneas del psoas, densidad aumentada',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Cavidad peritoneal',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'colelitiasis': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Vesícula',
      'proyeccion': 'AP',
      'descripcion': 'Calcificaciones en hipocondrio derecho',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Vesícula',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'nefrolitiasis': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Riñones',
      'proyeccion': 'AP',
      'descripcion': 'Cálculos radiopacos en siluetas renales',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Riñones',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS GASTROINTESTINALES
    'ulcera perforada': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Estómago',
      'proyeccion': 'AP de pie',
      'descripcion': 'Neumoperitoneo por perforación gástrica',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Estómago',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'obstruccion intestinal': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Intestino',
      'proyeccion': 'AP y Decúbito',
      'descripcion': 'Niveles hidroaéreos, dilatación proximal',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Intestino',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS URINARIAS
    'litiasis renal': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Riñones',
      'proyeccion': 'AP',
      'descripcion': 'Cálculos radiopacos en siluetas renales',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Riñones',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'hidronefrosis': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'Riñones',
      'proyeccion': 'AP',
      'descripcion': 'Aumento de tamaño de silueta renal',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Riñones',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS TRAUMÁTICAS
    'trauma abdominal': {
      'estudio': 'Radiografía de Abdomen',
      'region': 'Abdomen',
      'subregion': 'General',
      'proyeccion': 'AP',
      'descripcion': 'Neumoperitoneo, fracturas asociadas',
      'imagen_anatomia': 'assets/abdomen-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, abdomen vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Abdomen',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS DE PELVIS
    'fractura pelvica': {
      'estudio': 'Radiografía de Pelvis',
      'region': 'Pelvis',
      'subregion': 'Huesos Pélvicos',
      'proyeccion': 'AP',
      'descripcion': 'Fracturas en anillo pélvico o acetábulo',
      'imagen_anatomia': 'assets/pelvis-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, pelvis vacía',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Huesos pélvicos',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'luxacion cadera': {
      'estudio': 'Radiografía de Pelvis',
      'region': 'Pelvis',
      'subregion': 'Cadera',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Desplazamiento de la cabeza femoral del acetábulo',
      'imagen_anatomia': 'assets/pelvis-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, pelvis vacía',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Cadera',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'displasia cadera': {
      'estudio': 'Radiografía de Pelvis',
      'region': 'Pelvis',
      'subregion': 'Cadera',
      'proyeccion': 'AP',
      'descripcion': 'Alteración en el desarrollo de la articulación coxofemoral',
      'imagen_anatomia': 'assets/pelvis-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, pelvis vacía',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Cadera',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'necrosis avascular': {
      'estudio': 'Radiografía de Pelvis',
      'region': 'Pelvis',
      'subregion': 'Cadera',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Colapso de la cabeza femoral por falta de irrigación',
      'imagen_anatomia': 'assets/pelvis-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, pelvis vacía',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Cadera',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS DE COLUMNA
    'fractura vertebral': {
      'estudio': 'Radiografía de Columna',
      'region': 'Columna',
      'subregion': 'Vertebras',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Fractura por compresión o estallido vertebral',
      'imagen_anatomia': 'assets/columna-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, columna vacía',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Columna vertebral',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'escoliosis': {
      'estudio': 'Radiografía de Columna',
      'region': 'Columna',
      'subregion': 'Columna Total',
      'proyeccion': 'AP y Lateral de pie',
      'descripcion': 'Curvatura lateral anormal de la columna',
      'imagen_anatomia': 'assets/columna-lateral.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, columna vacía',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Columna vertebral',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'espondilolistesis': {
      'estudio': 'Radiografía de Columna',
      'region': 'Columna',
      'subregion': 'Columna Lumbar',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Deslizamiento anterior de una vértebra sobre otra',
      'imagen_anatomia': 'assets/columna-lateral.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, columna vacía',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Columna vertebral',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'hernia disco': {
      'estudio': 'Radiografía de Columna',
      'region': 'Columna',
      'subregion': 'Columna',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Protrusión del disco intervertebral',
      'imagen_anatomia': 'assets/columna-lateral.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, columna vacía',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Columna vertebral',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS DE EXTREMIDADES SUPERIORES
    'fractura clavicula': {
      'estudio': 'Radiografía de Hombro',
      'region': 'Extremidad Superior',
      'subregion': 'Clavícula',
      'proyeccion': 'AP y Axial',
      'descripcion': 'Fractura en cualquier segmento de la clavícula',
      'imagen_anatomia': 'assets/hombro-axial.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, hombro en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Clavícula',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'fractura humero': {
      'estudio': 'Radiografía de Húmero',
      'region': 'Extremidad Superior',
      'subregion': 'Brazo',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Fractura en diáfisis o extremos del húmero',
      'imagen_anatomia': 'assets/humerus-lateral.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, brazo en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Húmero',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'fractura colles': {
      'estudio': 'Radiografía de Muñeca',
      'region': 'Extremidad Superior',
      'subregion': 'Muñeca',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Fractura del radio distal con desplazamiento dorsal',
      'imagen_anatomia': 'assets/muñeca-lateral.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, muñeca en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Muñeca',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'luxacion hombro': {
      'estudio': 'Radiografía de Hombro',
      'region': 'Extremidad Superior',
      'subregion': 'Hombro',
      'proyeccion': 'AP y Axilar',
      'descripcion': 'Desplazamiento de la cabeza humeral del glenoide',
      'imagen_anatomia': 'assets/hombro-axial.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, hombro en posición neutra',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Húmero',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    // PATOLOGÍAS DE EXTREMIDADES INFERIORES
    'fractura cadera': {
      'estudio': 'Radiografía de Cadera',
      'region': 'Extremidad Inferior',
      'subregion': 'Cadera',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Fractura del cuello femoral o región trocantérica',
      'imagen_anatomia': 'assets/cadera-ap.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, cadera vacía',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Cadera',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'fractura femur': {
      'estudio': 'Radiografía de Fémur',
      'region': 'Extremidad Inferior',
      'subregion': 'Muslo',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Fractura en la diáfisis femoral',
      'imagen_anatomia': 'assets/fémur-lateral.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, muslo vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Fémur',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'fractura rotula': {
      'estudio': 'Radiografía de Rodilla',
      'region': 'Extremidad Inferior',
      'subregion': 'Rodilla',
      'proyeccion': 'AP y Lateral',
      'descripcion': 'Fractura de la rótula con o sin desplazamiento',
      'imagen_anatomia': 'assets/rodilla-lateral.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, rodilla vacía',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Rodilla',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
    'fractura tobillo': {
      'estudio': 'Radiografía de Tobillo',
      'region': 'Extremidad Inferior',
      'subregion': 'Tobillo',
      'proyeccion': 'AP, Lateral y Mortaja',
      'descripcion': 'Fractura uni, bi o trimaleolar',
      'imagen_anatomia': 'assets/tobillo-lateral.jpeg',
      'descripcion_tecnica': {
        'posicion_paciente': 'Sentado o en decúbito, tobillo vacío',
        'rayo_central': 'Perpendicular al receptor a nivel de L3',
        'estructuras_visualizadas': 'Tobillo',
        'criterios_calidad': 'Inspiración completa, contraste intravenoso'
      },
      'link_patologia': '', // Espacio para agregar link manualmente
    },
  };

  static Map<String, dynamic>? buscarRecomendacion(String diagnostico) {
    String busqueda = diagnostico.toLowerCase();
    try {
      return guiaRadiologica.entries
          .firstWhere((entry) => entry.key.contains(busqueda))
          .value;
    } catch (e) {
      return {
        'estudio': 'No encontrado',
        'region': '',
        'subregion': '',
        'proyeccion': '',
        'descripcion': 'No se encontró una recomendación para este diagnóstico'
      };
    }
  }

  static List<String> buscarSugerencias(String query) {
    query = query.toLowerCase();
    return guiaRadiologica.keys
        .where((key) => key.contains(query) || 
                       guiaRadiologica[key]!['descripcion'].toLowerCase().contains(query))
        .toList();
  }

  static final Map<String, List<String>> categoriasPatologias = {
    'Patologías Traumáticas del Cráneo': [
      'Fractura craneal lineal',
      'Fractura craneal conminuta',
      'Fractura craneal depresiva',
      'Fractura base craneo',
      'Hematoma epidural',
      'Fractura orbital',
    ],
    'Patologías Óseas del Cráneo': [
      'Enfermedad de Paget',
      'Craneosinostosis',
      'Osteomalacia',
      'Osteopetrosis',
      'Hiperostosis frontal',
      'Displasia fibrosa',
    ],
    'Patologías de Senos Paranasales': [
      'Sinusitis',
      'Polipos sinusales',
      'Mucocele',
      'Osteomas sinusales',
    ],
    'Patologías Dentales y Mandibulares': [
      'Absceso dental',
      'Osteomielitis mandibular',
      'Quistes dentales',
      'Tumores odontogénicos',
    ],
    'Cráneo y Cara': [
      'Fractura craneal',
      'Tumor óseo craneal',
      'Sinusitis',
      'Abscesos dentales',
      'Enfermedad periodontal',
    ],
    'Tórax': [
      'Fractura costal',
      'Neumonía',
      'Tuberculosis',
      'Neumotórax',
      'Derrame pleural',
      'Enfisema',
      'Cardiomegalia',
    ],
    'Columna Vertebral': [
      'Fractura vertebral',
      'Escoliosis',
      'Osteoporosis vertebral',
      'Espondilosis',
      'Espondilitis anquilosante',
    ],
    'Estudios Especiales': [
      'Esofagograma',
      'Serie gastroduodenal',
      'Tránsito intestinal',
      'Colon por enema',
      'Cistografía',
      'Histerosalpingografía',
    ],
    'Abdomen': [
      'Cuerpo extraño abdominal',
      'Obstrucción intestinal',
      'Cálculos renales',
    ],
    'Pelvis': [
      'Fractura pélvica',
      'Displasia de cadera',
      'Coxartrosis',
    ],
    'Extremidades Superiores': [
      'Fractura de clavícula',
      'Luxación de hombro',
      'Fractura de húmero',
      'Fractura de Colles',
      'Fractura de escafoides',
    ],
    'Extremidades Inferiores': [
      'Fractura de fémur',
      'Fractura de rótula',
      'Gonartrosis',
      'Fractura de tobillo',
      'Espolón calcáneo',
    ],
    'Patologías Pulmonares': [
      'Neumonía lobar',
      'Neumonía intersticial',
      'Tuberculosis pulmonar',
      'Absceso pulmonar',
      'Empiema pleural',
    ],
    'Patologías Oncológicas Torácicas': [
      'Cancer pulmonar',
      'Metastasis pulmonares',
      'Nodulo pulmonar solitario',
    ],
    'Patologías Obstructivas y Restrictivas': [
      'EPOC',
      'Enfisema pulmonar',
      'Fibrosis pulmonar',
      'Asma bronquial',
    ],
    'Patologías Vasculares y Cardíacas': [
      'Edema pulmonar',
      'Tromboembolismo pulmonar',
      'Cardiomegalia',
      'Insuficiencia cardíaca',
    ],
    'Patologías Traumáticas Torácicas': [
      'Neumotorax',
      'Hemotorax',
      'Fractura costal',
      'Contusión pulmonar',
    ],
    'Patologías Abdominales Generales': [
      'Ileo mecanico',
      'Ileo paralitico',
      'Volvulo',
      'Neumoperitoneo',
      'Ascitis',
    ],
    'Patologías Gastrointestinales': [
      'Ulcera perforada',
      'Obstruccion intestinal',
      'Volvulo de sigmoides',
      'Colitis grave',
    ],
    'Patologías Urinarias': [
      'Litiasis renal',
      'Hidronefrosis',
      'Litiasis ureteral',
      'Litiasis vesical',
    ],
    'Patologías Hepatobiliares': [
      'Colelitiasis',
      'Colecistitis',
      'Pancreatitis',
    ],
    'Patologías de Pelvis': [
      'Fractura pelvica',
      'Luxacion cadera',
      'Displasia cadera',
      'Necrosis avascular',
      'Artritis septica',
      'Osteoartritis sacroiliaca',
    ],
    'Patologías de Columna': [
      'Fractura vertebral',
      'Escoliosis',
      'Espondilolistesis',
      'Hernia disco',
      'Cifosis',
      'Lordosis',
      'Espondilitis anquilosante',
    ],
    'Patologías de Extremidades Superiores': [
      'Fractura clavicula',
      'Fractura humero',
      'Fractura colles',
      'Luxacion hombro',
      'Fractura escafoides',
      'Fractura metacarpiano',
    ],
    'Patologías de Extremidades Inferiores': [
      'Fractura cadera',
      'Fractura femur',
      'Fractura rotula',
      'Fractura tobillo',
      'Fractura calcaneo',
      'Esguince tobillo',
    ],
  };

  static void actualizarLinkPatologia(String patologia, String link) {
    if (guiaRadiologica.containsKey(patologia)) {
      guiaRadiologica[patologia]!['link_patologia'] = link;
    }
  }

  static String? obtenerImagenAnatomia(String patologia) {
    return guiaRadiologica[patologia]?['imagen_anatomia'];
  }

  static Map<String, String>? obtenerDescripcionTecnica(String patologia) {
    return guiaRadiologica[patologia]?['descripcion_tecnica'];
  }
} 
class RadiologiaHelper {
  static final Map<String, Map<String, dynamic>> guiaRadiologica = {
    // Patologías de Tórax
    'epoc': {
      'proyeccion': 'PA',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'descripcion': 'Enfermedad Pulmonar Obstructiva Crónica',
    },
    'neumonia': {
      'proyeccion': 'PA',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'descripcion': 'Infección que inflama los sacos aéreos',
    },
    'neumotorax': {
      'proyeccion': 'PA',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'descripcion': 'Presencia de aire en el espacio pleural',
    },
    'derrame pleural': {
      'proyeccion': 'Lateral',
      'region': 'Torax',
      'subregion': 'Pulmones',
      'descripcion': 'Acumulación de líquido en el espacio pleural',
    },

    // Patologías de Hombro
    'luxacion de hombro': {
      'proyeccion': 'AP',
      'region': 'Miembros Superiores',
      'subregion': 'Hombro',
      'descripcion': 'Desplazamiento de la articulación glenohumeral',
    },
    'fractura de clavicula': {
      'proyeccion': 'AP',
      'region': 'Miembros Superiores',
      'subregion': 'Hombro',
      'descripcion': 'Ruptura del hueso clavicular',
    },

    // Patologías de Cráneo
    'sinusitis': {
      'proyeccion': 'Waters',
      'region': 'Cabeza',
      'subregion': 'Senos Paranasales',
      'descripcion': 'Inflamación de los senos paranasales',
    },
    'traumatismo craneoencefalico': {
      'proyeccion': 'Lateral',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'descripcion': 'Lesión traumática en el cráneo o cerebro',
    },

    // Patologías de Rodilla
    'fractura de rotula': {
      'proyeccion': 'Lateral',
      'region': 'Miembros Inferiores',
      'subregion': 'Rodilla',
      'descripcion': 'Ruptura del hueso patelar',
    },
    'lesion de menisco': {
      'proyeccion': 'AP',
      'region': 'Miembros Inferiores',
      'subregion': 'Rodilla',
      'descripcion': 'Daño en el cartílago meniscal',
    },

    // Patologías Abdominales
    'apendicitis': {
      'proyeccion': 'AP',
      'region': 'Abdomen',
      'subregion': 'Abdomen Simple',
      'descripcion': 'Inflamación del apéndice',
    },
    'oclusion intestinal': {
      'proyeccion': 'AP',
      'region': 'Abdomen',
      'subregion': 'Abdomen Simple',
      'descripcion': 'Bloqueo del intestino',
    },

    // Patologías del Codo
    'epicondilitis lateral': {
      'proyeccion': 'AP',
      'region': 'Miembros Superiores',
      'subregion': 'Codo',
      'descripcion': 'Codo de tenista - Inflamación de los tendones laterales',
    },
    'epicondilitis medial': {
      'proyeccion': 'AP',
      'region': 'Miembros Superiores',
      'subregion': 'Codo',
      'descripcion': 'Codo de golfista - Inflamación de los tendones mediales',
    },
    'bursitis olecraniana': {
      'proyeccion': 'Lateral',
      'region': 'Miembros Superiores',
      'subregion': 'Codo',
      'descripcion': 'Inflamación de la bursa del olécranon',
    },
    'fractura de cabeza radial': {
      'proyeccion': 'Lateral',
      'region': 'Miembros Superiores',
      'subregion': 'Codo',
      'descripcion': 'Fractura en la parte superior del radio',
    },
    'luxacion del codo': {
      'proyeccion': 'AP y Lateral',
      'region': 'Miembros Superiores',
      'subregion': 'Codo',
      'descripcion': 'Desplazamiento de la articulación del codo',
    },

    // Patologías de Mano y Muñeca
    'sindrome del tunel carpiano': {
      'proyeccion': 'AP',
      'region': 'Miembros Superiores',
      'subregion': 'Muñeca',
      'descripcion': 'Compresión del nervio mediano en el túnel carpiano',
    },
    'fractura de colles': {
      'proyeccion': 'AP y Lateral',
      'region': 'Miembros Superiores',
      'subregion': 'Muñeca',
      'descripcion': 'Fractura del radio distal',
    },
    'fractura del escafoides': {
      'proyeccion': 'AP y Lateral',
      'region': 'Miembros Superiores',
      'subregion': 'Muñeca',
      'descripcion': 'Fractura del hueso escafoides del carpo',
    },
    'dedo en gatillo': {
      'proyeccion': 'AP y Oblicua',
      'region': 'Miembros Superiores',
      'subregion': 'Mano',
      'descripcion': 'Bloqueo del tendón flexor del dedo',
    },

    // Patologías de Rodilla (agregando a las existentes)
    'luxacion rotuliana': {
      'proyeccion': 'AP y Lateral',
      'region': 'Miembros Inferiores',
      'subregion': 'Rodilla',
      'descripcion': 'Desplazamiento de la rótula',
    },
    'esguince de ligamento': {
      'proyeccion': 'AP',
      'region': 'Miembros Inferiores',
      'subregion': 'Rodilla',
      'descripcion': 'Lesión de los ligamentos colaterales',
    },
    'ruptura de ligamento cruzado': {
      'proyeccion': 'AP y Lateral',
      'region': 'Miembros Inferiores',
      'subregion': 'Rodilla',
      'descripcion': 'Ruptura de ligamentos cruzados anterior o posterior',
    },

    // Patologías de Tobillo y Pie
    'esguince de tobillo': {
      'proyeccion': 'AP y Lateral',
      'region': 'Miembros Inferiores',
      'subregion': 'Tobillo',
      'descripcion': 'Lesión de los ligamentos del tobillo',
    },
    'fractura de maleolo': {
      'proyeccion': 'AP y Lateral',
      'region': 'Miembros Inferiores',
      'subregion': 'Tobillo',
      'descripcion': 'Fractura del maléolo tibial o peroneo',
    },
    'hallux valgus': {
      'proyeccion': 'AP y Oblicua',
      'region': 'Miembros Inferiores',
      'subregion': 'Pie',
      'descripcion': 'Juanetes - Deformidad del primer dedo del pie',
    },
    'fractura de metatarso': {
      'proyeccion': 'AP y Oblicua',
      'region': 'Miembros Inferiores',
      'subregion': 'Pie',
      'descripcion': 'Fractura de los huesos metatarsianos',
    },

    // Patologías de Cabeza y Cráneo
    'cefalea tensional': {
      'proyeccion': 'AP y Lateral',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'descripcion': 'Dolor de cabeza por tensión muscular',
    },
    'neuralgia del trigemino': {
      'proyeccion': 'AP y Lateral',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'descripcion': 'Dolor intenso en el nervio trigémino',
    },
    'hemorragia subaracnoidea': {
      'proyeccion': 'AP y Lateral',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'descripcion': 'Sangrado en el espacio subaracnoideo',
    },
    'tumores cerebrales': {
      'proyeccion': 'AP y Lateral',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'descripcion': 'Masas anormales en el tejido cerebral',
    },

    // Sistema Nervioso
    'accidente cerebrovascular': {
      'proyeccion': 'AP y Lateral',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'descripcion': 'ACV o ictus - Interrupción del flujo sanguíneo cerebral',
    },
    'meningitis': {
      'proyeccion': 'AP y Lateral',
      'region': 'Cabeza',
      'subregion': 'Cráneo',
      'descripcion': 'Inflamación de las meninges',
    },

    // Abdomen
    'hernia inguinal': {
      'proyeccion': 'AP',
      'region': 'Abdomen',
      'subregion': 'Abdomen Simple',
      'descripcion': 'Protrusión de tejido a través de la pared abdominal',
    },
    'pancreatitis': {
      'proyeccion': 'AP',
      'region': 'Abdomen',
      'subregion': 'Abdomen Simple',
      'descripcion': 'Inflamación del páncreas',
    },
    'colecistitis': {
      'proyeccion': 'AP',
      'region': 'Abdomen',
      'subregion': 'Abdomen Simple',
      'descripcion': 'Inflamación de la vesícula biliar',
    },
    'cirrosis hepatica': {
      'proyeccion': 'AP',
      'region': 'Abdomen',
      'subregion': 'Abdomen Simple',
      'descripcion': 'Daño crónico del hígado',
    },

    // Tracto Urinario y Sistema Reproductor
    'calculos renales': {
      'proyeccion': 'AP',
      'region': 'Abdomen',
      'subregion': 'Sistema Urinario',
      'descripcion': 'Litiasis renal - Piedras en los riñones',
    },
    'cancer de prostata': {
      'proyeccion': 'AP',
      'region': 'Pelvis',
      'subregion': 'Pelvis Ósea',
      'descripcion': 'Tumor maligno de la próstata',
    },
    'endometriosis': {
      'proyeccion': 'AP',
      'region': 'Pelvis',
      'subregion': 'Pelvis Ósea',
      'descripcion': 'Tejido endometrial fuera del útero',
    },

    // Corazón y Sistema Circulatorio
    'cardiomegalia': {
      'proyeccion': 'PA y Lateral',
      'region': 'Torax',
      'subregion': 'Tórax Óseo',
      'descripcion': 'Agrandamiento del corazón',
    },
    'pericarditis': {
      'proyeccion': 'PA y Lateral',
      'region': 'Torax',
      'subregion': 'Tórax Óseo',
      'descripcion': 'Inflamación del pericardio',
    },
    'aneurisma aortico': {
      'proyeccion': 'PA y Lateral',
      'region': 'Torax',
      'subregion': 'Tórax Óseo',
      'descripcion': 'Dilatación anormal de la aorta',
    },
  };

  static List<String> buscarSugerencias(String query) {
    query = query.toLowerCase();
    return guiaRadiologica.keys
        .where((key) => key.contains(query) || 
                       guiaRadiologica[key]!['descripcion'].toLowerCase().contains(query))
        .toList();
  }

  static Map<String, List<String>> categoriasPatologias = {
    // Sistema Nervioso Central y Cabeza
    'Cabeza y Cráneo': [
      'Cefalea tensional',
      'Migraña',
      'Sinusitis',
      'Neuralgia del trigémino',
      'Traumatismo craneoencefálico (TCE)',
      'Hemorragia subaracnoidea',
      'Tumores cerebrales',
    ],
    'Sistema Nervioso': [
      'Accidente cerebrovascular (ACV)',
      'Esclerosis múltiple',
      'Enfermedad de Parkinson',
      'Epilepsia',
      'Meningitis',
      'Alzheimer',
      'Esclerosis lateral amiotrófica (ELA)',
    ],
    
    // Tórax y Sistema Cardiopulmonar
    'Corazón y Sistema Circulatorio': [
      'Hipertensión arterial',
      'Arritmias cardíacas',
      'Cardiomiopatía dilatada',
      'Endocarditis infecciosa',
      'Pericarditis',
      'Trombosis venosa profunda',
      'Aneurisma aórtico',
      'Shock cardiogénico',
    ],
    'Tórax': [
      'EPOC',
      'Neumonía',
      'Neumotórax',
      'Derrame pleural',
      'Asma',
      'Enfisema pulmonar',
    ],

    // Abdomen y Sistema Digestivo/Urinario
    'Abdomen': [
      'Apendicitis',
      'Oclusión intestinal',
      'Hernia inguinal',
      'Pancreatitis',
      'Colecistitis',
      'Cirrosis hepática',
      'Úlcera gástrica',
      'Reflujo gastroesofágico (ERGE)',
    ],
    'Tracto Urinario y Reproductor': [
      'Infección urinaria',
      'Cálculos renales',
      'Insuficiencia renal crónica',
      'Cáncer de próstata',
      'Endometriosis',
      'Síndrome de ovario poliquístico',
      'Enfermedad inflamatoria pélvica',
    ],

    // Extremidades Superiores
    'Hombro': [
      'Luxación de hombro',
      'Fractura de clavícula',
      'Tendinitis del manguito rotador',
      'Capsulitis adhesiva',
    ],
    'Codo': [
      'Epicondilitis lateral (Codo de tenista)',
      'Epicondilitis medial (Codo de golfista)',
      'Bursitis olecraniana',
      'Fractura de cabeza radial',
      'Luxación del codo',
    ],
    'Mano y Muñeca': [
      'Síndrome del túnel carpiano',
      'Fractura de Colles',
      'Fractura del escafoides',
      'Dedo en gatillo',
      'Tenosinovitis de De Quervain',
      'Artritis reumatoide',
    ],

    // Extremidades Inferiores
    'Rodilla': [
      'Fractura de rótula',
      'Luxación rotuliana',
      'Lesión de menisco',
      'Esguince de ligamento colateral',
      'Ruptura del ligamento cruzado',
      'Condromalacia rotuliana',
      'Bursitis prepatelar',
    ],
    'Tobillo y Pie': [
      'Esguince de tobillo',
      'Fractura del maléolo',
      'Fascitis plantar',
      'Hallux valgus',
      'Fractura de metatarso',
      'Neuroma de Morton',
      'Pie diabético',
    ],
  };
} 
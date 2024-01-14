import 'package:get/get.dart';
import 'package:match_flutter/pages/match_page.dart';
import 'package:match_flutter/pages/armador_juegos.dart';
import 'package:match_flutter/pages/jugadores_details.dart';
import 'package:match_flutter/pages/partidos_fechas.dart';

class RoutesHelper {
  static const initial = '/';
  static const jugadores = '/jugadores';
  static const armador = '/armador-equipo';
  static const hayEquipo = '/equipo';
  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: initial,
      page: () => const Partidos(),
    ),
    GetPage(
      name: jugadores,
      page: () => const Jugadores(),
    ),
    GetPage(
      name: armador,
      page: () => const Armador(),
    ),
    GetPage(
      name: hayEquipo,
      page: () => const MatchPage(),
    )
  ];
}

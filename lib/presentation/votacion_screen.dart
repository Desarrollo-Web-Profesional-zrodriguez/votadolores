import 'package:flutter/material.dart';
import '../modelos/opcion_votacion.dart';
import '../modelos/votacion.dart';
import '../modelos/resultado_opcion.dart';
import '../logica/resultado_voto.dart';
import '../logica/servicio_votacion.dart';

class VotacionScreen extends StatefulWidget {
  const VotacionScreen({super.key});

  @override
  State<VotacionScreen> createState() => _VotacionScreenState();
}

class _VotacionScreenState extends State<VotacionScreen> {
  late final Votacion _votacion;
  late final ServicioVotacion _servicio;
  bool _yaVote = false;
  final String _idUsuario =
      'invitado-${DateTime.now().millisecondsSinceEpoch}';

  @override
  void initState() {
    super.initState();
    _votacion = Votacion(
      pregunta: '¿Qué obra prioritaria debe realizar el municipio este año?',
      opciones: [
        OpcionVotacion(
          id: 'jardin',
          texto: 'Rehabilitación del Jardín Principal',
        ),
        OpcionVotacion(
          id: 'biblioteca',
          texto: 'Nueva Biblioteca Digital',
        ),
        OpcionVotacion(
          id: 'alumbrado',
          texto: 'Alumbrado en el Barrio de Analco',
        ),
        OpcionVotacion(
          id: 'parque',
          texto: 'Parque Infantil en la Colonia Guanajuato',
        ),
      ],
      fechaCierre: DateTime.now().add(const Duration(days: 7)),
    );
    _servicio = ServicioVotacion(_votacion);
  }

  void _votar(String idOpcion) {
    final resultado = _servicio.registrarVoto(
      idUsuario: _idUsuario,
      idOpcion: idOpcion,
    );
    if (resultado == ResultadoVoto.exitoso) {
      setState(() => _yaVote = true);
      _mensaje('¡Voto registrado con éxito! Gracias por participar.');
    } else if (resultado == ResultadoVoto.usuarioYaVoto) {
      _mensaje('Ya registramos tu voto en este plebiscito.');
    } else if (resultado == ResultadoVoto.votacionCerrada) {
      _mensaje('Esta votación ya cerró.');
    }
  }

  void _mensaje(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(texto),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _verGanador() {
    final ganadores = _servicio.determinarGanador();
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'ganador',
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (context, anim1, anim2) => const SizedBox.shrink(),
      transitionBuilder: (context, anim1, anim2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: anim1, curve: Curves.elasticOut),
          child: FadeTransition(
            opacity: anim1,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Row(
                children: [
                  Icon(Icons.emoji_events, color: Colors.amber, size: 28),
                  SizedBox(width: 8),
                  Text('Resultado del plebiscito'),
                ],
              ),
              content: Text(
                ganadores.length == 1
                    ? 'La opción ganadora es:\n\n🏆 ${ganadores.first.texto}'
                    : 'Hay un empate entre:\n\n${ganadores.map((g) => '🤝 ${g.texto}').join('\n')}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
              actions: [
                FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cerrar'),
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
    final resultados = _servicio.obtenerResultados();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo.shade700,
        foregroundColor: Colors.white,
        title: const Text(
          'Plebiscito Vecinal — Dolores Hidalgo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.how_to_vote,
                              color: Colors.indigo.shade600, size: 26),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              'Consulta Ciudadana 2026',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _yaVote
                                  ? Colors.teal.shade50
                                  : Colors.amber.shade50,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              _yaVote ? 'Ya votaste' : 'Votación Activa',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: _yaVote
                                    ? Colors.teal.shade800
                                    : Colors.amber.shade900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        _votacion.pregunta,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E293B),
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ...resultados.map(
                (r) => _BarraOpcion(
                  resultado: r,
                  puedeVotar: !_yaVote,
                  onVotar: () => _votar(r.opcion.id),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.indigo.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _verGanador,
                icon: const Icon(Icons.emoji_events, color: Colors.amber),
                label: const Text(
                  'Ver resultado del plebiscito',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BarraOpcion extends StatelessWidget {
  final ResultadoOpcion resultado;
  final bool puedeVotar;
  final VoidCallback onVotar;

  const _BarraOpcion({
    required this.resultado,
    required this.puedeVotar,
    required this.onVotar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          const BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  resultado.opcion.texto,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: resultado.porcentaje),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutCubic,
                builder: (context, valor, _) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${valor.toStringAsFixed(1)}% (${resultado.opcion.votos})',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.indigo.shade800,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: 18,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: resultado.porcentaje / 100),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOutCubic,
                    builder: (context, valor, _) => Container(
                      height: 18,
                      width: constraints.maxWidth * valor,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.indigo.shade400,
                            Colors.indigo.shade700,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          if (puedeVotar) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.indigo.shade700,
                  side: BorderSide(color: Colors.indigo.shade300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: onVotar,
                icon: const Icon(Icons.check_circle_outline, size: 18),
                label: const Text(
                  'Votar por esta opción',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

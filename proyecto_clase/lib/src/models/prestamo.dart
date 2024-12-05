class Prestamo {
  final int prestamoId;
  final int clienteId;
  final double tasaInteres;
  final int plazo;
  final double monto;
  final double saldo;
  final DateTime fechaCreacion;
  final DateTime fechaPrestamo;
  final bool estado;

  Prestamo({
    required this.prestamoId,
    required this.clienteId,
    required this.tasaInteres,
    required this.plazo,
    required this.monto,
    required this.saldo,
    required this.fechaCreacion,
    required this.fechaPrestamo,
    required this.estado,
  });

  factory Prestamo.fromJson(Map<String, dynamic> json) {
    return Prestamo(
      prestamoId: json['prestamoId'],
      clienteId: json['clienteId'],
      tasaInteres: json['tasaInteres'].toDouble(),
      plazo: json['plazo'],
      monto: json['monto'].toDouble(),
      saldo: json['saldo'].toDouble(),
      fechaCreacion: DateTime.parse(json['fechaCreacion']),
      fechaPrestamo: DateTime.parse(json['fechaPrestamo']),
      estado: json['estado'],
    );
  }
}

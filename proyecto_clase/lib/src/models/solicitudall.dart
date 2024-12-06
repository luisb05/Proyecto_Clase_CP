class Solicitud {
  final int solicitudId;
  final int customerId;
  final String proposito;
  final double tasaInteres;
  final int plazo;
  final double monto;
  final String fechaCreacion;
  final String fechaPrestamo;
  final bool estado;

  Solicitud({
    required this.solicitudId,
    required this.customerId,
    required this.proposito,
    required this.tasaInteres,
    required this.plazo,
    required this.monto,
    required this.fechaCreacion,
    required this.fechaPrestamo,
    required this.estado,
  });

  factory Solicitud.fromJson(Map<String, dynamic> json) {
    return Solicitud(
      solicitudId: json['solicitudId'],
      customerId: json['customerId'],
      proposito: json['proposito'],
      tasaInteres: json['tasaInteres'],
      plazo: json['plazo'],
      monto: json['monto'],
      fechaCreacion: json['fechaCreacion'],
      fechaPrestamo: json['fechaPrestamo'],
      estado: json['estado'],
    );
  }

  static List<Solicitud> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => Solicitud.fromJson(e)).toList();
  }
}

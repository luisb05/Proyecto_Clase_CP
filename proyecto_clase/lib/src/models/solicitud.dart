import 'dart:convert';

List<Solicitud> solicitudFromJson(String str) =>
    List<Solicitud>.from(json.decode(str).map((x) => Solicitud.fromJson(x)));

String solicitudToJson(List<Solicitud> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Solicitud {
  final int solicitudId;

  final int customerId;

  final String proposito;

  final double tasaInteres;

  final int plazo;

  final double monto;

  final DateTime fechaCreacion;

  final DateTime fechaPrestamo;

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

  factory Solicitud.fromJson(Map<String, dynamic> json) => Solicitud(
        solicitudId: json["solicitudId"],
        customerId: json["customerId"],
        proposito: json["proposito"],
        tasaInteres: json["tasaInteres"].toDouble(),
        plazo: json["plazo"],
        monto: json["monto"].toDouble(),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaPrestamo: DateTime.parse(json["fechaPrestamo"]),
        estado: json["estado"] == true || json["estado"] == 1,
      );

  Map<String, dynamic> toJson() => {
        "solicitudId": solicitudId,
        "customerId": customerId,
        "proposito": proposito,
        "tasaInteres": tasaInteres,
        "plazo": plazo,
        "monto": monto,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaPrestamo": fechaPrestamo.toIso8601String(),
        "estado": estado,
      };

  String get estadoTexto => estado ? "Aprobada" : "Pendiente";
  Solicitud copyWith({
    int? solicitudId,
    int? customerId,
    String? proposito,
    double? tasaInteres,
    int? plazo,
    double? monto,
    DateTime? fechaCreacion,
    DateTime? fechaPrestamo,
    bool? estado,
  }) {
    return Solicitud(
      solicitudId: solicitudId ?? this.solicitudId,
      customerId: customerId ?? this.customerId,
      proposito: proposito ?? this.proposito,
      tasaInteres: tasaInteres ?? this.tasaInteres,
      plazo: plazo ?? this.plazo,
      monto: monto ?? this.monto,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
      fechaPrestamo: fechaPrestamo ?? this.fechaPrestamo,
      estado: estado ?? this.estado,
    );
  }
}

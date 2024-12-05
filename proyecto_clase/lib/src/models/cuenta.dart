class Cuenta {
  int cuentaId;
  int customerId;
  double saldoInicial;
  double cuotaAporte;
  double saldo;
  DateTime fechaCreacion;
  DateTime fechaPrestamo;
  bool estado;

  Cuenta({
    required this.cuentaId,
    required this.customerId,
    required this.saldoInicial,
    required this.cuotaAporte,
    required this.saldo,
    required this.fechaCreacion,
    required this.fechaPrestamo,
    required this.estado,
  });

  factory Cuenta.fromJson(Map<String, dynamic> json) => Cuenta(
        cuentaId: json["cuentaId"],
        customerId: json["customerId"],
        saldoInicial: json["saldoInicial"]?.toDouble() ?? 0.0,
        cuotaAporte: json["cuotaAporte"]?.toDouble() ?? 0.0,
        saldo: json["saldo"]?.toDouble() ?? 0.0,
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaPrestamo: DateTime.parse(json["fechaPrestamo"]),
        estado: json["estado"],
      );
}

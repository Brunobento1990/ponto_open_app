class Mascara {
  static String? mascaraCpf(String? cpf) {
    if (cpf == null || cpf.isEmpty) return null;
    final tresPrimeirosNumeros = cpf.substring(0, 3);
    final tresSegundosNumeros = cpf.substring(3, 6);
    final tresTerceirosNumeros = cpf.substring(6, 9);
    final ultimosNumeros = cpf.substring(9);

    return '$tresPrimeirosNumeros.$tresSegundosNumeros.$tresTerceirosNumeros-$ultimosNumeros';
  }
}
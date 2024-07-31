class ResponseLocalizacaoDto {
  final String endereco;
  ResponseLocalizacaoDto({required this.endereco});

  factory ResponseLocalizacaoDto.fromJson(Map<String, dynamic> json) {
    return ResponseLocalizacaoDto(endereco: json['endereco']);
  }
}

class Metadata {
  List<int> toSeeId;
  String notes;
  String source;
  String warning;
  String toQuestion;

  Metadata(
      this.notes, this.source, this.warning, this.toQuestion, this.toSeeId);

  static Metadata empty() {
    return Metadata("", "", "", "", []);
  }

  @override
  String toString() {
    return """    
      Notes : $notes,
      Source : $source,
      Warning : $warning,
      To Question : $toQuestion
""";
  }

  static Metadata prequeEmpty(List<int> toSeeId) {
    return Metadata("", "", "", "", toSeeId);
  }
}

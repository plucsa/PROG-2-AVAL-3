import 'dart:math';

class DNASequence {
  final String sequence;
  DNASequence(this.sequence) : assert(_isValidSequence(sequence));
  factory DNASequence.random(int length) {
    final random = Random();
    final nucleotides = ['A', 'T', 'C', 'G'];
    String randomSequence = '';
    for (int i = 0; i < length; i++) {
      final randomIndex = random.nextInt(nucleotides.length);
      randomSequence += nucleotides[randomIndex];
    }
    return DNASequence(randomSequence);
  }
  DNASequence get reversedSequence {
    String reversedSequence = sequence.split('').reversed.join('');
    return DNASequence(reversedSequence);
  }

  DNASequence get complementSequence {
    String complementSequence = '';
    for (int i = 0; i < sequence.length; i++) {
      final nucleotide = sequence[i];
      switch (nucleotide) {
        case 'A':
          complementSequence += 'T';
          break;
        case 'T':
          complementSequence += 'A';
          break;
        case 'C':
          complementSequence += 'G';
          break;
        case 'G':
          complementSequence += 'C';
          break;
      }
    }
    return DNASequence(complementSequence);
  }

  int countNucleotideOccurrences(String nucleotide) {
    if (!_isValidNucleotide(nucleotide)) {
      throw ArgumentError('Invalid nucleotide: $nucleotide');
    }
    return sequence.split(nucleotide).length - 1;
  }

  static bool _isValidSequence(String sequence) {
    final validNucleotides = ['A', 'T', 'C', 'G'];
    for (int i = 0; i < sequence.length; i++) {
      if (!validNucleotides.contains(sequence[i])) {
        throw ArgumentError('Invalid sequence: $sequence');
      }
    }
    return true;
  }

  static bool _isValidNucleotide(String nucleotide) {
    final validNucleotides = ['A', 'T', 'C', 'G'];
    return validNucleotides.contains(nucleotide);
  }

  @override
  String toString() {
    return sequence;
  }
}

void main() {
  final dnaSequence = DNASequence('ATTG');
  print(dnaSequence);
  print(dnaSequence.reversedSequence);
  print(dnaSequence.complementSequence);
  print(dnaSequence.countNucleotideOccurrences("A"));
  print(dnaSequence.countNucleotideOccurrences("T"));
  print(dnaSequence.countNucleotideOccurrences("C"));
  print(dnaSequence.countNucleotideOccurrences("G"));
  final randomSequence = DNASequence.random(10);
  print(randomSequence);
}

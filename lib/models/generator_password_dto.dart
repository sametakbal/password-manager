import 'dart:math';

class GeneratePasswordDto {
  int lenght = 12;
  bool includeSymbols = false;
  bool includeNumbers = true;
  bool includeLowercaseCharacters = true;
  bool includeUpperCaseCharacters = true;
  bool includeAmbiguousCharacters = false;

  String generatePassword() {
    Random rand = Random();
    String pass = '';
    String symbols = '+%!£€@-*&/#<>?';
    String ambiguous = '{}~][()"|_,';
    int lMin = 97, lMax = 122, uMin = 65, uMax = 90;
    int lowerCounter = 0,
        upperCounter = 0,
        symbolCounter = 0,
        ambigiousCounter = 0,
        numberCounter = 0;
    for (int i = 0; pass.length < lenght; i++) {
      int selected = rand.nextInt(4);
      if ((numberCounter == 0 && includeNumbers) ||
          (includeNumbers && selected == 0)) {
        pass += rand.nextInt(10).toString();
      }
      if ((lowerCounter == 0 && includeLowercaseCharacters) ||
          (includeLowercaseCharacters && selected == 1)) {
        pass += String.fromCharCode((rand.nextInt(lMax - lMin) + lMin));
      }
      if ((upperCounter == 0 && includeUpperCaseCharacters) ||
          (includeUpperCaseCharacters && selected == 2)) {
        pass += String.fromCharCode((rand.nextInt(uMax - uMin) + uMin));
      }
      if ((ambigiousCounter == 0 && includeAmbiguousCharacters) ||
          (includeAmbiguousCharacters && selected == 3)) {
        pass += ambiguous[rand.nextInt(ambiguous.length)];
      }
      if ((symbolCounter == 0 && includeSymbols) ||
          (includeSymbols && selected == 4)) {
        pass += symbols[rand.nextInt(symbols.length)];
      }
    }
    return pass.length > lenght ? pass.substring(0, lenght) : pass;
  }

  bool checkCondition() {
    return includeSymbols ||
        includeNumbers ||
        includeLowercaseCharacters ||
        includeUpperCaseCharacters ||
        includeAmbiguousCharacters;
  }
}

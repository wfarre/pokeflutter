String formatPokemonId(int number) {
  const idLength = 3;
  late String stringNumber = number.toString();

  if (stringNumber.length < idLength) {
    print(idLength - stringNumber.length);
    for (var i = 0; i <= idLength - stringNumber.length; i++) {
      stringNumber = '0$stringNumber';
    }
  }

  print('#$stringNumber');
  return '#$stringNumber';
}

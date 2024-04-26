const isPrime = function(number) {
  if (number <= 1) {
    return false;
  }

  for (let currentNumber = 2; currentNumber < number; currentNumber += 1) {
    if (number % currentNumber === 0) {
      return false;
    }
  }

  return true;
};

isPrime(1);
isPrime(2);
isPrime(3);
isPrime(43);
isPrime(55);
isPrime(0);
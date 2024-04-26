function logMultiples(number) {
  for (let currentNumber = 100; currentNumber >= number; currentNumber -= 1) {
    if (currentNumber % number === 0 && currentNumber % 2 === 1) {
      console.log(currentNumber);
    }
  }
}

logMultiples(17);
logMultiples(21);

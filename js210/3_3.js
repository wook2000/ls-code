function logOddNumbers(number) {
  for (let currentNumber = 1; currentNumber <= number; currentNumber += 1) {
    if (currentNumber % 2 === 1) {
      console.log(currentNumber);
    }
  }
}

logOddNumbers(19);

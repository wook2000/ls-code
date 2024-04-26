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

function checkGoldback(expectedSum) {
  if (expectedSum % 2 === 1 || expectedSum < 4) {
    console.log(null);
  } else {
    for (let primeCandidate = 2; primeCandidate <= expectedSum / 2; primeCandidate += 1) {
      if (isPrime(primeCandidate) && isPrime(expectedSum - primeCandidate)) {
        console.log(`${primeCandidate} ${expectedSum - primeCandidate}`)
      }
    }
  }
}

checkGoldback(3);
checkGoldback(4);
checkGoldback(12);
checkGoldback(100);
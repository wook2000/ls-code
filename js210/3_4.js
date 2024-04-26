function multiplesOfThreeAndFive() {
  for (let number = 1; number <= 100; number += 1) {
    if (number % 3 === 0 && number %5 === 0) {
      console.log(String(number) + '!');
    } else if (number % 3 === 0 || number % 5 === 0) {
      console.log(String(number));
    }
  }
}

multiplesOfThreeAndFive();

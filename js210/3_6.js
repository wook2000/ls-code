function fizzbuzz() {
  for (let number = 1; number <= 100; number += 1) {
    let message = number;

    if (number % 3 === 0 && number % 5 === 0) {
      message = 'FizzBuzz';
    } else if (number % 3 === 0) {
      message = 'Fizz';
    } else if (number % 5 === 0) {
      message = 'Buzz';
    }

    console.log(message);
  }
}


fizzbuzz();

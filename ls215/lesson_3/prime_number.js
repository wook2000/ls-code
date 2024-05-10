/*
***P
Input: string of letters and numbers
Output: array of integers
Rules:
  - Extract digits from the string
  - Check to see if formed numbers are prime
  - Return all prime numbers in an array

***Q
Input arguments
- Can there be more than one argument?
- Can the argument be a non-string data type?
- Can the argument be an empty string?
- Can the argument contain non-alphanumeric characters?

Process

Output
- What should an empty string return?
- What happens if no prime numbers are found?

***H
- Use match() to extract all the numbers
- Create a isPrime() helper function

***E
primeNumberPrinter("a4bc2k13d"); // [2, 13]
primeNumberPrinter("2k13d"); // [2, 13]
primeNumberPrinter("a4bc2k13"); // [2, 13]
primeNumberPrinter("a4bcd"); // []
primeNumberPrinter(""); // []
primeNumberPrinter("!4@#2*13d"); // [2, 13]

***D
- string
- array of integers
- filtered array of integers

***A
- string.prototype.match()
- filter using isPrime()
- return

*/
function isPrime(int) {
  if (int < 2) {
    return false;
  }

  for (let div = 2; div <= Math.sqrt(int); div += 1) {
    if (int % div === 0) {
      return false;
    }
  }

  return true;
}

function primeNumberPrinter(string) {
  if (/[\d]+/.test(string) === false) {
    return [];
  }

  return string.match(/[\d]+/g).filter(isPrime);
}

console.log(primeNumberPrinter("a4bc2k13d")); // [2, 13]
console.log(primeNumberPrinter("2k13d")); // [2, 13]
console.log(primeNumberPrinter("a4bc2k13")); // [2, 13]
console.log(primeNumberPrinter("a4bcd")); // []
console.log(primeNumberPrinter("")); // []
console.log(primeNumberPrinter("!4@#2*13d")); // [2, 13]
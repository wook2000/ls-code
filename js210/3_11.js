function gcd(int1, int2) {
  for (let divisor = Math.min(int1, int2); divisor >= 1; divisor -= 1) {
    if (int1 % divisor === 0 && int2 % divisor === 0) {
      return divisor;
    }
  }
}

console.log(gcd(12,4));
console.log(gcd(15,10));
console.log(gcd(9,2));

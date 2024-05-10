const digitToDecimal = function(elem, idx, arr) {
  return elem * Math.pow(8, arr.length - idx - 1);
};

const add = function(sum, value) {
  return sum + value;
};

const octalToDecimal = function(numberString) {
  return numberString.split('').map(digitToDecimal).reduce(add);
};

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9
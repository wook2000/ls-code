function findDigitIdx(array) {
  return array.findIndex(elem => /\d/.test(elem));
}

function findLetterIdx(array) {
  return array.findIndex(elem => /[a-z]/i.test(elem));
}

function swap(str) {
  let arr = str.split('');
  let test = [...arr];

  while (findDigitIdx(test) !== -1 && findLetterIdx(test) !== -1) {
    let digitIdx = findDigitIdx(test);
    let letterIdx = findLetterIdx(test);
    [ arr[digitIdx], arr[letterIdx] ] = [arr[letterIdx], arr[digitIdx]];
    [ test[digitIdx], test[letterIdx] ] = ['#', '#'];
  }

  return arr.join('');
}

console.log(swap("1a2b3c") === "a1b2c3"); // true
console.log(swap("abcd123") === "123dabc"); // true
console.log(swap("135kel") === "kee135"); // false
console.log(swap("135246kel") === "kel246135");  // true
console.log(swap("") === ""); // true
console.log(swap("a") === "a"); // true
console.log(swap("12a") === "a21"); // true
console.log(swap("ab1") === "1ba"); // true
console.log(swap("abcd") === "abcd"); // true
console.log(swap("1") === "1"); // true
console.log(swap("123-4a#b$") === "ab3-41#2$"); // true
console.log(swap("ab1CD23") === "12a3DbC"); // true

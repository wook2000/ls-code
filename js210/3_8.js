const isXor = (arg1, arg2) => {
  return !!arg1 === !arg2
};

console.log(isXor(false, true));
console.log(isXor(true, false));
console.log(isXor(false, false));
console.log(isXor(true, true));

console.log(isXor(false, 3));
console.log(isXor('a', undefined));
console.log(isXor(null, ''));
console.log(isXor('2', 23));

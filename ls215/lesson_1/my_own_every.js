function myOwnEvery(array, func) {
  for (let idx = 0; idx < array.length; idx += 1) {
    if (!func(array[idx])) {
      return false;
    }
  }

  return true;
}

let isAString = value => typeof value === 'string';
console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));       // true
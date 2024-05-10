function myReduce(array, func, initial) {
  let arrayCopy = array.slice();
  let result;

  if (initial === undefined) {
    result = arrayCopy.shift();
  } else {
    result = initial;
  }

  arrayCopy.forEach(function (element) {
    result = func(result, element);
  });

  return result;
}

let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49
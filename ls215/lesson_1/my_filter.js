function myFilter(array, func) {
  let newArray = [];

  // for (let idx = 0; idx < array.length; idx += 1) {
  //   if (func(array[idx], idx, array)) {
  //     newArray.push(array[idx]);
  //   }
  // }

  array.forEach(element => {
    if (func(element)) {
      newArray.push(element);
    }
  });

  return newArray;
}

let isPythagoreanTriple = function (triple) {
  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
};

console.log(myFilter([{ a: 3, b: 4,  c: 5 },
          { a: 5, b: 12, c: 13 },
          { a: 1, b: 2,  c: 3 },], isPythagoreanTriple));

// returns [ { a: 3, b: 4, c: 5 }, { a: 5, b: 12, c: 13 } ]
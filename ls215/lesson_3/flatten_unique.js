/*
***P
Input: 2D array of mixed data type
Output: 1D array
Rules:
  - concatenate the nested arrays
  - treat number strings as numbers
  - delete duplicate values

***Q
Input arguments
- Can there be more than one argument?
- Will the argument always be nested?
- Can the argument be an empty array? Yes
- How many elements can the argument array have?
- Will all elements be nested?
- Can the elements be a non-string / non-integer data type?

Process
- Can the input array be mutated?

Output
- What to output for empty array? Empty array

***H
- need a guard clause to filter out empty array
- create a result array
- iterate through argument and concat to result array
- transform all number strings to numbers
- filter out duplicate values
- return result

***E
flattenAndUnique([]); // []
flattenAndUnique([[1, 2, 3], ['3', 4, 5, 'a']]); // [1, 2, 3, 4, 5, 'a']
flattenAndUnique([1, @, 5], [6, @, 8]); // [1, 5, 6, 8]
flattenAndUnique([2, 2, 2], [2, 2, 2]); // [2]
flattenAndUnique([1], [1], [2]); // [1, 2]

***D

***A
- guard clause to test empty array
- create result array
- .concat() to concat arrays into result array
- toNumbers() helper function
- isDuplicate() helper function expression
- return result array

*/

function toNumbers(arr) {
  let result = [];

  arr.forEach(elem => {
    if (Number(elem)) {
      result.push(Number(elem));
    } else {
      result.push(elem);
    }
  });

  return result;
}

function flattenAndUnique(array) {
  if (array === undefined) {
    return [];
  }

  let resultArr = [];

  array.forEach(subArr => resultArr = resultArr.concat(subArr));

  resultArr = toNumbers(resultArr);

  let isDuplicate = (elem, idx, arr) => !arr.slice(0, idx).includes(elem);
  return resultArr.filter(isDuplicate);
}

console.log(flattenAndUnique([])); // []
console.log(flattenAndUnique([[1, 2, 3], ['3', 4, 5, 'a']])); // [1, 2, 3, 4, 5, 'a']
console.log(flattenAndUnique([[1, '@', 5], [6, '@', 8]])); // [1, '@', 5, 6, 8]
console.log(flattenAndUnique([[2, 2, 2], [2, 2, 2]])); // [2]
console.log(flattenAndUnique([[1], [1], [2]])); // [1, 2]
console.log(flattenAndUnique()); // []
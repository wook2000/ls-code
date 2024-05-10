/*
***Problem
- Input: array of string 'arr', integer 'k'
- Output: string element from 'arr'
- Rules:
  - distinct string is a string that is present only once
  - find the 'k'th distinct string
  - if fewer than 'k' distinct strings, return empty string ''

***Questions
Argument
- Will there always be one array and one integer?
- Will 'arr' only have strings as elements?
- Will there ever be more than 1 integer provided?
- Can the argument order be flipped?
- Can the array be empty?
- Can the integer argument be omitted?
- Will the second argument always be an integer?
- Any input validation required?

Process
- Can the argument array be mutated?

Output


***Hypothesis
- 'arr' needs to be transformed into an array containing only those elements
  that are present once
- first, count the number of occurrences for each element and store in object
- iterate through the object and push only those elements with count = 1 into
  new array
- find the 'k'th string, which would be 'k-1' index of new array
- set some guard clauses

***Examples / Test cases
distinctString(["d","b","c","b","c","a"], 2); // "a"
  countObj = { d: 1, b: 2, c: 2, a: 1 }
  newArr = ['d', 'a']
  k = 2, so index k-1 is index 1 which is 'a'

console.log(distinctString(["d","b","c","b","c","a"], 1) === 'a');
console.log(distinctString([], 1) === '');
console.log(distinctString(['a', 'a', 'b', 'c']) === '');
console.log(distinctString(['a', 'a', 'b', 'c'], 3) === '');
console.log(distinctString(['a', 'a', 'b', 'c'], 1) === 'b');

***Data structures
- array to object
- object to array
- select array element

***Algorithm
- guard clause to protect against empty string or omitted second argument
- countObj = countOccurences(arr);
- newArr = findDistinct(countObj);
- return newArr[k-1] || '';
for (string in countObj) to check value and push into newArr get count = 1

*/

function countOccurences(arr) {
  let result = {};

  arr.forEach(elem => {
    result[elem] = result[elem] || 0;
    result[elem] += 1;
  });

  return result;
}

function findDistinct(obj) {
  let result = [];

  for (let string in obj) {
    if (obj[string] === 1) {
      result.push(string);
    }
  }

  return result;
}

function distinctString(arr, kthDistinct) {
  if (arr.length === 0 || kthDistinct === undefined) {
    return 'Invalid input';
  }

  let countObj = countOccurences(arr);
  let newArr = findDistinct(countObj);

  return newArr[kthDistinct - 1] || '';
}

console.log(distinctString(["d","b","c","b","c","a"], 2) === 'a');
console.log(distinctString([], 1) === 'Invalid input');
console.log(distinctString(['a', 'a', 'b', 'c']) === 'Invalid input');
console.log(distinctString(['a', 'a', 'b', 'c'], 3) === '');
console.log(distinctString(['a', 'a', 'b', 'c'], 1) === 'b');

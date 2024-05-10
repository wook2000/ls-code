/*
***P
Input: array of integers (num)
Output: integer
Rules:
  - return the third largest number in the array
  - if the third largest number does not exist, then return greatest number

***Q
Input arguments
- Can there be more than one array?
- Can there be data types other than array provided as input?
- Can the array be empty?
- Can the array have non-Number values?
- Can the array be nested?
- Can the array be omitted?
- Can the array have less than 3 integers?


Process
- What does it mean that I cannot sort? Can a sorted array be made without
  using the sort() method?
- Can the input array be mutated?

Output
-

***H
- without sorting, perhaps the best way to proceed would be to filter out the
  max number 3 times

- find greatest number
- if max number = -Infinity, return greatest number

- loop 2 times
  + filter out max number
  + find next max number
  + if max number = -Infinity, return greatest number

return max number

***E
console.log(thirdMax[3, 2, 1] === 1);
console.log(thirdMax[] === 'Invalid input');
console.log(thirdMax[2, 1] === 2);
console.log(thirdMax[2, 2, 1] === 2);
console.log(thirdMax[3] === 3);

***D

***A

*/
function thirdMax(array) {
  let localArr = [...array];
  let greatest = Math.max(...localArr);

  if (greatest === -Infinity) {
    return 'Invalid input';
  }

  let max = greatest;

  for (let count = 1; count <= 2; count += 1) {
    localArr = localArr.filter(elem => elem !== max);
    max = Math.max(...localArr);

    if (max === -Infinity) {
      return greatest;
    }
  }

  return max;
}

console.log(thirdMax([3, 2, 1]) === 1);
console.log(thirdMax([]) === 'Invalid input');
console.log(thirdMax([2, 1]) === 2);
console.log(thirdMax([2, 2, 1]) === 2);
console.log(thirdMax([3]) === 3);
console.log(thirdMax([4, 4, 6, 6, 3, 2, 2, 1]) === 3);

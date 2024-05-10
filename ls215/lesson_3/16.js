/* eslint-disable max-lines-per-function */
/*
***P
Input: string that represents a "word"
Output: boolean
Rules:
  - spell the given word using the blocks
  - only one letter on a block can be used at a time
  - each block can only be used once
  - case insensitive

***Q
Input arguments
- What constitutes a word?
- Will there be only one argument?
- Will the argument always be a string?
- Can the string have any characters besides the alphabet?
- Could the argument be an empty string?

Process

Output
- What to output if empty string?

***H
- let's assign the block letters as an array to an object
- iterate through each letter of the string
  + identify which block and count it in new object
  + if block was already used, return false
- return true if make it through the entire iteration

***E
isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true
isBlockWord('Both');       // false
isBlockWord('');           // 'Invalid input'

***D

***A
- guard against empty string and return 'Invalid input'
- declare constant BLOCK
- for loop through each character of string
  + for each character, loop through BLOCK to find block and count it
  + if BLOCK has already been used, return false
- return true

*/

const BLOCK = {
  1: ['B', 'O'],
  2: ['G', 'T'],
  3: ['V', 'I'],
  4: ['X', 'K'],
  5: ['R', 'E'],
  6: ['L', 'Y'],
  7: ['D', 'Q'],
  8: ['F', 'S'],
  9: ['Z', 'M'],
  10: ['C', 'P'],
  11: ['J', 'W'],
  12: ['N', 'A'],
  13: ['H', 'U'],
};

function isBlockWord(string) {
  if (string === undefined || string.length === 0) {
    return 'Invalid input';
  }

  let countObj = {};

  for (let idx = 0; idx < string.length; idx += 1) {
    for (let key = 1; key <= 13; key += 1) {
      if (BLOCK[key].includes(string[idx].toUpperCase())) {
        if (countObj[key]) {
          // console.log(countObj);
          return false;
        } else {
          countObj[key] = true;
          break;
        }
      }
    }
  }

  // console.log(countObj);
  return true;
}

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('Both'));       // false
console.log(isBlockWord(''));           // 'Invalid input'
console.log(isBlockWord());             // 'Invalid input'

console.log(isBlockWord('floW'));       // true
console.log(isBlockWord('APPLE'));      // false
console.log(isBlockWord('apple'));      // false
console.log(isBlockWord('apPLE'));      // false
console.log(isBlockWord('Box'));        // false
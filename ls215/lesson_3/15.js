/*
***P
Input: number in string format
Output: boolean
Rules:
  - ignore all non-numeric characters in the input string
  - read the number from right to left
  - double the value of every second digit
    + if the doubled valued is greater than 9, subtract 9 from the result
  - sum the digits together
  - check the (sum % 10) to see if it is 0
  - return true if 0, false if not

***Q
Input arguments
- Will there only be one argument?
- Will the argument always be a string?
- Will the argument always have a number in it?
- Can the argument be an empty string?
- Is there a minimum number of digits that input has to contain?

Process
- What happens when the input is '0'?

Output

***H
- guard against empty string to avoid any potential issues with null/undefined
- replace non-numeric characters
- split input into array and reverse and iterate from index 0
- transform each array element according to rule
- reduce array using add()
- return sum % 10 === 0

***E
isValidLuhn('1111') !== true
isValidLuhn('8763') === true
isValidLuhn('2323 2005 7766 3554') === true
isValidLuhn('0') === true
isValidLuhn('') !== true
isValidLuhn('8hello7world6!!!3') === true

***D

***A
- return false if input length = 0 or input === undefined
- replace /[^\d]/ with ''
- split and reverse
- map with doubleSecondDigit()
- reduce with add()
*/

function doubleSecondDigit(num, idx) {
  if (idx % 2 === 0) {
    return num;
  } else {
    let result = num * 2;

    if (result > 9) {
      result -= 9;
    }

    return result;
  }
}

function add(acc, num) {
  return acc + num;
}

function isValidLuhn(stringNum) {
  if (stringNum === undefined || stringNum.length === 0) {
    return false;
  }

  let workingString = stringNum.replace(/[^\d]/g, '');
  let workingArray = workingString.split('').reverse().map(Number);
  let transformedArray = workingArray.map(doubleSecondDigit);
  let sum = transformedArray.reduce(add);

  return sum % 10 === 0;
}

console.log(isValidLuhn('1111') !== true);
console.log(isValidLuhn('8763') === true);
console.log(isValidLuhn('2323 2005 7766 3554') === true);
console.log(isValidLuhn('0') === true);
console.log(isValidLuhn('') !== true);
console.log(isValidLuhn('8hello7world6!!!3') === true);
console.log(isValidLuhn() !== true);

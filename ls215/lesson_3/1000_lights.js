/*
***P
Input: one integer representing total number of lights
Output: array of integers representing the lights that are on
Rules:
  - there are switches from 1 to n
  - all switches start from off position
  - n passes are made to toggle lights
    + toggle means off to on and on to off
  - first pass gets all lights
  - second pass gets every multiple of 2
  - third pass gets every multiple of 3
  - probably nth pass gets every multiple of n

***C
lightsOn(5);        // [1, 4]
lightsOn(100);      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
  orig  1   2   3   4   5
1 - f - t
2 - f - t - f
3 - f - t - t - f
4 - f - t - f - f - t
5 - f - t - t - t - t - f

// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

***Q
Input arguments
- Will there always be an argument?
- Will there always be one argument?
- Will the argument always be an integer?
- Can the argument be a float, Infinity, or NaN?
- Can the argument be zero?

Process

Output
- What to output when zero lights? []

***H
- have to create a bank of lights
  + perhaps create an object with the light number as keys
- let's use true/false to determine lights on/off
- set the bank of lights to false
- nested loop
  + first, loop through to determine the nth iteration
  + then access the nth multiple of the bank of lights
  + toggle using !
- push out to result array those keys that have a value of true

***E
lightsOn(0);        // []
lightsOn(5);        // [1, 4]
lightsOn(100);      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

***D
- Number
- lightObj
- array of lightObj keys

***A
- declare lightObj as empty object
- declare lightObj properties as false
- nested loop
  + outer for loop from 1 to n
  + inner forEach of lightObj keys
  + toggle nth multiple

***V

*/

function lightsOn(switches) {
  if (switches === 0) {
    return [];
  }

  let lightObj = {};

  for (let key = 1; key <= switches; key += 1) {
    lightObj[key] = false;
  }

  for (let count = 1; count <= switches; count += 1) {
    Object.keys(lightObj).forEach(key => {
      if (key % count === 0) {
        lightObj[key] = !lightObj[key];
      }
    });
  }

  return Object.keys(lightObj).filter(key => lightObj[key] === true);
}

console.log(lightsOn(5));        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

console.log(lightsOn(100));      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]